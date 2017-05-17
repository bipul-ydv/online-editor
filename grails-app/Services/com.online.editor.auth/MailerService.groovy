package com.online.editor.auth

import grails.plugin.asyncmail.AsynchronousMailService


class MailerService {
    def utilityService

    AsynchronousMailService asynchronousMailService
    def grailsApplication

    def sendForgotPasswordEmail(User user) {
        String verificationLink = "${grailsApplication.config.grails.serverURL}/resetPassword/${user.forgotPasswordUUID}"
        String fullName = user. getUsername()
        try {
            asynchronousMailService.sendMail {
                to user?.email
                subject "Forgot Password"
                body(view: "../mailTemplates/ResetPasswordLink", model: [fullName: fullName, verificationLink: verificationLink])

            }
        }
        catch (Throwable throwable) {
            log.error "Problem in sending forgot password email to the user : ${user}, ${throwable}"
        }
    }
}