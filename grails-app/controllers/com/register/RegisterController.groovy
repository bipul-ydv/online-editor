package com.register

import com.online.editor.auth.Role
import com.online.editor.auth.User
import com.online.editor.auth.UserRole
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.transaction.annotation.Transactional

@Secured('permitAll')
class RegisterController {

    def index() {
        [userInstance: new User(params)]
    }

    @Transactional
    def create(UserCommand userCommand){
        if(userCommand.validate()){
            User user = new User()
            bindData(user, userCommand)
            user.save(flush: true,failOnError:true)
            Role role = Role.findByAuthority("ROLE_USER")
            UserRole userRole = new UserRole(user: user, role: role)
            userRole.save(flush: true,failOnError:true)
            flash.message = "Registered Successfully"
            render view:"index"
        }else
        if (userCommand.hasErrors()) {
            render view: "index", model: [userInstance:userCommand]
            return
        }
    }
}
