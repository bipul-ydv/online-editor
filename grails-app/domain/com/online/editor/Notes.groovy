package com.online.editor

import com.online.editor.auth.User

class Notes {
    String id
    String myTextField
    static belongsTo = [user:User]

    static mapping = {
        myTextField type: 'text'
        id generator:'uuid'
    }

    static constraints = {
        user nullable: true
    }
}
