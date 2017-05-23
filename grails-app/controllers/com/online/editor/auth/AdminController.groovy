package com.online.editor.auth

import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonBuilder

@Secured("hasRole('ROLE_SWITCH_USER')")
class AdminController {
    def utilityService

    def home() { }

    def allUserInfo(){
        def users = User.getAll()
        [users:users]
   }

    def usersRegisteredToday(){
        Date date = new Date()
        Integer totalUserSignupToday = User.createCriteria().count() {
            between("dateCreated", utilityService.getTodayStart(date), utilityService.getTodayEnd(date))

        }
        def date1 = utilityService.getTodayStart(date)
        def date2 = utilityService.getTodayEnd(date)
        render "success"

    }
    def index(){
        def users = User.getAll()
        [users:users]
    }

    def switchUser(){

    }
     def userSignUp(){
         def users = User.findAll().sort{it.dateCreated};
         Map<Date,Integer> result = users.collectEntries{
             [it.dateCreated.getTime(),it.count]
         }
         return result

     }
    def ajaxGetRegisteredUser = {

        def userData = userSignUp()
        def json = new JsonBuilder()

        json(
                userData.collect {
                    [
                            it.key,
                            it.value
                    ]
                }
        )

       render json.toPrettyString()
    }
}
