package com.online.editor.auth

import com.cloudinary.Cloudinary
import com.cloudinary.utils.ObjectUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.plugins.rest.client.RestBuilder
import org.springframework.transaction.annotation.Transactional
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap
import javax.imageio.ImageIO
import javax.xml.bind.DatatypeConverter
import java.awt.image.BufferedImage
import static org.springframework.http.HttpStatus.OK

@Secured(['ROLE_USER','ROLE_ADMIN'])
class UserController {
    def asyncMailService
    def utilityService
    def mailerService
    def asynchronousMailService
    def springSecurityService
    static allowedMethods = [updateProfile: "POST"]

    @Secured('IS_AUTHENTICATED_ANONYMOUSLY')
    def forgotPassword(){
    }

    @Secured('IS_AUTHENTICATED_ANONYMOUSLY')
    def processForgottenPassword(){
        if (!params.email && (params.email.toString().size() == 0)) {
            flash.error = g.message(code: 'user.forgetPassword.provideEmail')
            render(view: 'forgotPassword')
            return
        }
        String email = params.email
        User user = User.findByEmail(email)
        if(!user){
            flash.warning = g.message(code: 'user.forgetPassword.incorrectEmail')
            render(view: 'forgotPassword')
            return
        }
        String uuid = UUID.randomUUID().toString()
        user.forgotPasswordUUID = uuid
        utilityService.validateObjectAndSave("Problem in saving uuid in user", user)
        mailerService.sendForgotPasswordEmail(user)
        [email:email]
    }

    @Secured('IS_AUTHENTICATED_ANONYMOUSLY')
    def changePassword(){
        if(!params.uuid){
            flash.error = "${g.message(code: 'user.forgetPassword.linkExpired')}"
            redirect controller: 'login' , action: 'auth'
            return
        }
        User user = User.findByForgotPasswordUUID(params.uuid)
        if (!user) {
            flash.error = "${g.message(code: 'user.forgetPassword.linkExpired')}"
            redirect controller: 'login' , action: 'auth'
            return
        }
        [uuid: params.uuid]
    }

    @Secured('IS_AUTHENTICATED_ANONYMOUSLY')
    def saveNewPassword(){
        if(!params.uuid){
            flash.error = "${g.message(code: 'user.forgetPassword.linkExpired')}"
            redirect controller: 'login' , action: 'auth'
            return
        }
        User user = User.findByForgotPasswordUUID(params.uuid)
        if (!user) {
            flash.error = "${g.message(code: 'user.forgetPassword.linkExpired')}"
            redirect controller: 'login' , action: 'auth'
            return
        }

        if (params.password.size() <= 0 || params.password.size() <= 0) {
            if (params.newPassword.size() <= 0) {
                flash.message = "${g.message(code: 'user.changePassword.newPasswordFieldEmpty')}"
            } else {
                flash.message = "${g.message(code: 'user.changePassword.confirmNewPasswordFieldEmpty')}"
            }
            render(view: 'changePassword', model: [uuid: params.uuid])
            return
        }

        if (!params.password.toString().equals(params.confirmPassword)) {
            flash.error = g.message(code: 'user.changePassword.mismatch.label')
            render(view: 'changePassword', model: [uuid: params.uuid])
            return
        }

        user.password = params.password
        try {
            utilityService.validateObjectAndSave("Problem in saving new password.", user)
            user.forgotPasswordUUID = null
            user.save(flush:true,failOnError:true)

        }  catch (Throwable throwable) {
            log.error("Problem in saving the password." + throwable.message)
            flash.message = "Problem in saving the password." + throwable.message
            render(view: 'changePassword', model: [uuid: params.uuid])
            return
        }
        flash.message = "You have successfully change your password"
        redirect controller: 'login' , action: 'auth'
    }

    @Secured('permitAll')
    def index() {
        [userInstance: new User(params)]
    }

    @Transactional
    def create(UserCommand userCommand) {
        String responseVal = params.'g-recaptcha-response';
        RestBuilder rest = new RestBuilder()
        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
        form.add("secret", "6LetkSEUAAAAAGaD99LZKyl5xXk5Hq7g71KKojp3")
        form.add("response", responseVal)
        def resp = rest.post("https://www.google.com/recaptcha/api/siteverify") {
            accept("application/json")
            contentType("application/x-www-form-urlencoded")
            body(form)
        }
        boolean captcha_validate = resp.json.success
        if (userCommand.validate() && captcha_validate) {
            User user = new User()
            user.enabled=false
            bindData(user, userCommand)
            user.forgotPasswordUUID = UUID.randomUUID()
            user.save()
            Role role = Role.findByAuthority("ROLE_USER")
            UserRole userRole = new UserRole(user: user, role: role)
            userRole.save()
            String url = grailsLinkGenerator.link(controller: 'user', action: 'verifyAccount', id:user.forgotPasswordUUID, absolute: true)
            asynchronousMailService.sendMail {
                to user?.email
                subject "Email Confirmation"
                body("Please confirm your email by clicking this link or copy paste in browser: "+url)
            }
            flash.message = "Registered Successfully Verification Email is send to You"
            redirect(action:"auth",controller:"login")
        }
        else if (userCommand.hasErrors() || (!captcha_validate)) {
            if (!captcha_validate) {
                flash.warning = "Captcha Failed"
            }
            render view: "index", model: [userInstance: userCommand]
        }
    }

    @Secured('permitAll')
    def verifyAccount(){
        User user = User.findByForgotPasswordUUID(params.id)
        if(!user){
            render "Link has expired"
            return
        }
        user.enabled =true
        user.forgotPasswordUUID = null
        user.save()
        flash.message = "Account Activated Please login"
        redirect(action:"auth",controller:"login")
    }


    def showProfile(){
        User user = springSecurityService.getCurrentUser()
        if(!user){
            return
        }else{
            respond user
        }
    }

    def editProfile(){
        User user = springSecurityService.getCurrentUser()
        if(!user){
            return
        }else{
            respond user
        }
    }

    @Transactional
    def updateProfile(User user){
        if (user == null) {
            render view: "../404"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        Map uploadResult = null
        if(params.fileupload != "undefined") {
            String str = params.fileupload
            byte[] imagedata = DatatypeConverter.parseBase64Binary(str.substring(str.indexOf(",") + 1));
            BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata));
            ImageIO.write(bufferedImage, "png", new File("${user.username}.png"));
            String apiKey = getGrailsApplication().config.grails.plugin.cloudinary.apiKey
            String apiSecret = getGrailsApplication().config.grails.plugin.cloudinary.apiSecret
            String cloudName = getGrailsApplication().config.grails.plugin.cloudinary.cloudName
            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", cloudName, "api_key", apiKey, "api_secret", apiSecret));
            File file = new File("${user.username}.png");
            uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
        }
        User currentUser = springSecurityService.getCurrentUser()
        User existingUser = User.findByUsername(user.username)
        if(currentUser.id == existingUser.id) {
            if(params.fileupload == "undefined") {
                params.fileupload = existingUser.imageUrl
            }else{
                existingUser.imageUrl = uploadResult?.url
            }
            if(existingUser.imageUrl == null) {
                bindData(existingUser, params,[exclude: ['imageUrl']])
                flash.message = "Profile Updated"
                existingUser.save()
            } else {
                bindData(existingUser, params)
                flash.message = "Profile Updated"
                existingUser.save(flush:true)
            }
        }
        if (existingUser.hasErrors()) {
            respond existingUser.errors, view:'showProfile'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'profile.label', default: 'Profile')])
                redirect action: 'showProfile'
            }
            '*'{ respond user, [status: OK] }
        }
    }
}
