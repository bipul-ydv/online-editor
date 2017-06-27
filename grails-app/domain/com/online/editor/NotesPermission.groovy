package com.online.editor

class NotesPermission {
    String notesId
    String emailId
    Boolean allowRead
    Boolean allowWrite

    static constraints = {
        emailId email: true
        allowRead nullable: true
        allowWrite nullable: true
    }
}
