package com.online.editor.auth

import grails.plugin.springsecurity.annotation.Secured


class UserController {
    def asyncMailService
    def utilityService
    def mailerService

    def index() { }

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
            flash.error = "Email Id Not Registered.Please Signup First"
            redirect controller: 'login' , action: 'auth'
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
            flash.message = g.message(code: 'user.changePassword.mismatch.label')
            render(view: 'changePassword', model: [uuid: params.uuid])
            return
        }

        user.password = params.password
        try {
            utilityService.validateObjectAndSave("Problem in saving new password.", user)
            user.forgotPasswordUUID = null
//            utilityService.validateObjectAndSave('problem in saving forgot password uuid.', user)
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

}
