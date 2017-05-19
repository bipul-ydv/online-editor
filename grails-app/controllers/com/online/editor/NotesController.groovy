package com.online.editor

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['permitAll'])
@Transactional(readOnly = true)
class NotesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Notes.list(params), model:[notesCount: Notes.count()]
    }

    def show(Notes notes) {
        respond notes
    }

    def create() {
        respond new Notes(params)
    }

    @Transactional
    def save(Notes notes) {
        println params
        if (notes == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (notes.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond notes.errors, view:'create'
            return
        }

        notes.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notes.label', default: 'Notes'), notes.id])
                redirect notes
            }
            '*' { respond notes, [status: CREATED] }
        }
    }

    def edit(Notes notes) {
        println notes.myTextField
        respond notes
    }

    @Transactional
    def update(Notes notes) {
        if (notes == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (notes.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond notes.errors, view:'edit'
            return
        }

        notes.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'notes.label', default: 'Notes'), notes.id])
                redirect notes
            }
            '*'{ respond notes, [status: OK] }
        }
    }

    @Transactional
    def delete(Notes notes) {

        if (notes == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        notes.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'notes.label', default: 'Notes'), notes.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
}