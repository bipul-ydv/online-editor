package com.register

import com.online.editor.auth.User


class UserCommand implements grails.validation.Validateable {

    String username
    String firstname
    String lastname
    String dob
    String street
    String city
    String email
    String password
    String confirm_password
    String gender

    static constraints ={
        username blank:false,validator: {uname,obj->
            if(User.findByUsername(uname)){
                return "User already exist"
            }
        }
        firstname  nullable: true
        lastname  nullable: true
        email email:true, nullable: true
        street nullable: true
        city nullable:true
        dob nullable: true
        gender  nullable: true
        password validator: { pass, obj ->
            obj.confirm_password == pass
        }
//        password matches:'((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})'
    }

}
