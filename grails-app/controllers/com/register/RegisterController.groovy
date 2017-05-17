package com.register

import com.online.editor.auth.Role
import com.online.editor.auth.User
import com.online.editor.auth.UserRole
import grails.plugin.springsecurity.annotation.Secured
import grails.plugins.rest.client.RestBuilder
import org.springframework.transaction.annotation.Transactional
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap

@Secured('permitAll')
class RegisterController {

    def index() {
        [userInstancse: new User(params)]
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
            bindData(user, userCommand)
            user.save(flush: true, failOnError: true)
            Role role = Role.findByAuthority("ROLE_USER")
            UserRole userRole = new UserRole(user: user, role: role)
            userRole.save(flush: true, failOnError: true)
            flash.message = "Registered Successfully"
            render view: "index"
            }
        else if (userCommand.hasErrors() || (!captcha_validate)) {
            if (!captcha_validate) {
                flash.warning = "Captcha Failed"
            }
            render view: "index", model: [userInstance: userCommand]
        }
    }
}
