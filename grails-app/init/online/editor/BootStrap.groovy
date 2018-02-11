package online.editor
import com.online.editor.auth.*;

class BootStrap {

    def init = { servletContext ->
        if (!Role.findByAuthority("ROLE_SWITCH_USER")) {
            User user1 = new User(username: "admin", password: "Admin@215",email: "bipulydv@gmail.com").save(flush: true, failOnError: true)
            User user2 = new User(username: "jessy", password: "Jessy@215",email: "bipulydv@gmail.com").save(flush: true, failOnError: true)
            Role role1 = new Role(authority: "ROLE_SWITCH_USER").save(flush:true,failOnError: true)
            Role role2 = new Role(authority: "ROLE_USER").save(flush: true, failOnError: true)
            UserRole userRole1 = new UserRole(user: user1, role: role1).save(flush: true, failOnError: true)
            UserRole userRole2 = new UserRole(user: user2, role: role2).save(flush: true, failOnError: true)
        }
    }
    def destroy = {
    }
}
