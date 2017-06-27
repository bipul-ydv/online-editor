package com.online.editor

import com.online.editor.auth.Content
import com.online.editor.auth.User
import grails.plugin.asyncmail.AsynchronousMailService
import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_USER','ROLE_ADMIN'])
@Transactional(readOnly = true)
class NotesController {
    AsynchronousMailService asynchronousMailService
    def springSecurityService
    def groovyPageRenderer
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        User user = springSecurityService.getCurrentUser()
        params.max = Math.min(max ?: 10, 100)
        def val = Notes.findAllByUser(user);
        List<Content> text = Notes.executeQuery("Select id,SUBSTRING(myTextField, 1, 140) from Notes where user=?",[user], [offset:params.offset, max:params.max]);
        respond val, model:[notesCount: Notes.countByUser(user),usernotes:text]
    }

    @Secured('permitAll')
    def show(Notes notes) {
        List<NotesPermission> note = NotesPermission.findAllByNotesId(notes.id)
        if(note.size()>1){
            respond notes
        }else {
            User presentUser = springSecurityService?.currentUser
            NotesPermission permitUser = NotesPermission.findByEmailId(presentUser?.email)
            if (permitUser == null) {
                render view: "../404"
            }

            if ((notes.user == presentUser) || (permitUser != null)) {
                respond notes
            } else {
                render view: "../404"
            }
        }
    }

    def create() {
        respond new Notes(params)
    }

    @Transactional
    def save(Notes notes) {
        if (notes == null) {
            render view: "../404"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (notes.hasErrors()) {
            if(params.myTextField == '') {
                flash.warning = "Empty Note Cannot be saved"
            }
            transactionStatus.setRollbackOnly()
            respond notes.errors, view:'create'
            return
        }
        User user = springSecurityService.getCurrentUser()
        notes.save()
        user.addToNotes(notes).save()
        notes.save()
        //set the permission of the notes to user who created
        NotesPermission notesPermission = new NotesPermission(emailId: user.email,notesId: notes.id,allowRead: true,allowWrite: true).save()
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notes.label', default: 'Notes')])
                redirect notes
            }
            '*' { respond notes, [status: CREATED] }
        }
    }

    def edit(Notes notes) {
        User presentUser  = springSecurityService.currentUser
        NotesPermission notesPermission = NotesPermission.findByEmailId(presentUser?.email)
        if(notesPermission == null){
            render view: "../404"
        }
        if((notes.user == presentUser) || (notesPermission?.allowWrite)){
            respond notes
        }else {
            render view: "../404"
        }
    }

    @Transactional
    def update(Notes notes) {
        if(params.myTextField == '') {
            flash.warning = "Empty Note Cannot be saved"
        }
        if (notes == null) {
            render view: "../404"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (notes.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond notes.errors, view:'edit'
            return
        }
        User presentUser  = springSecurityService.currentUser
        NotesPermission notesPermission = NotesPermission.findByEmailId(presentUser?.email)
        if(notesPermission == null){
            render view: "../404"
        }
        if((notes.user == presentUser) || (notesPermission?.allowWrite)) {
            notes.save()
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'notes.label', default: 'Notes')])
                redirect notes
            }
            '*'{ respond notes, [status: OK] }
        }
    }

    @Transactional
    def delete(Notes notes) {
            if (notes == null) {
            render view: "../404"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if(notes.user == springSecurityService.currentUser) {
            notes.delete()
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'notes.label', default: 'Notes')])
                redirect action:"index", method:"GET", params:[offset:params.offset]
            }
            '*'{ render status: NO_CONTENT }
        }
    }


    def mailMe(){
        Object obj = new Object();
        Notes note = Notes.get(params.id)
        synchronized (obj){
            File file = new File("myNote.text");
            User user = springSecurityService.getCurrentUser();
            file.write(note.myTextField)
            if (file.exists()) {
                asynchronousMailService.sendMail {
                    to user?.email
                    subject "My Note"
                    body("Please find your notes")
                    attachBytes file.getName(), 'text/plain', file.getBytes();
                }
                file.delete()
            }
        }
        flash.message = "Notes are mailed at your email Id"
        redirect controller:"Notes", action:"index"
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'notes.label', default: 'Notes'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    def share(){
        List<User> allUserEmail = params.emailList
        String notesUrl =  grailsLinkGenerator.link(controller: 'notes', action: 'show', id:params.id, absolute: true)
        ArrayList<NotesPermission> alreadyShared = NotesPermission.findAllByNotesId(params?.id)
        List<String> registerdUser = User.executeQuery("Select email from User where email IN (:list)",[list:allUserEmail]);
        List<String> newUser = new ArrayList<>();
        Set allUser = new HashSet<String>();
        allUser.addAll(registerdUser )
        allUser.addAll(alreadyShared.emailId)
         for (int i = 0; i <params.emailList.size(); i++) {
            if(!allUser.contains(params.emailList[i])) {
                if(params.emailList[i].size() == 0) {
                    continue
                }
                newUser.add(params.emailList[i].toString())
            }
        }
        List<String> inviteUser = new ArrayList<>();
        for (int j = 0; j < params.emailList.size(); j++) {
            if (!allUser.contains(params.emailList[j])) {
                inviteUser.add(params.emailList[j])
                NotesPermission noteP = new NotesPermission(notesId: params.id, emailId: params.emailList[j])
                if (params.permission[j] == 'write') {
                    noteP.allowRead = true
                    noteP.allowWrite = true
                } else {
                    noteP.allowRead = true
                    noteP.allowWrite = false
                }
                noteP.save()
            }
        }
            if (newUser.size() > 0) {
                def content = groovyPageRenderer.render(template: '/notes/haapybirthday')
                asynchronousMailService.sendMail {
                    to newUser
                    subject "Notes Invitation"
                    body("${springSecurityService.currentUser.username} has shared a document with you. You can view the note here: " + notesUrl);
                }
            }
            flash.message = "Notes Shared"
            redirect controller: "notes", action: "index"
    }
}