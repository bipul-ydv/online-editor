package online.editor
import com.online.editor.auth.*;

class BootStrap {

    def init = { servletContext ->
        User user1 = new User(username:"admin",password: "admin").save(flush:true)
        User user2 = new User(username: "parul",password: "parul").save(flush:true)
        Role role1 = new Role(authority:"ROLE_ADMIN").save(flush:true)
        Role role2 = new Role(authority:"ROLE_USER").save(flush:true)
        UserRole userRole1 = new UserRole(user: user1,role: role1).save(flush:true)
        UserRole userRole2 = new UserRole(user: user2,role: role2).save(flush:true)
    }
    def destroy = {
    }
}
