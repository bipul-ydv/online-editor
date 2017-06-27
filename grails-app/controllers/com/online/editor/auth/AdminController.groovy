package com.online.editor.auth

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonBuilder

@Secured("hasRole('ROLE_SWITCH_USER')")
class AdminController {
    def utilityService

    def signUpChart() {
        render template: "signUpChart"
        return
    }

    def allUserInfo(){
        def users = User.getAll()
        [users:users]
   }

    def usersRegisteredToday(){
        Date date = new Date()
        Integer totalUserSignupToday = User.createCriteria().count() {
            between("dateCreated", utilityService.getTodayStart(date), utilityService.getTodayEnd(date))
        }
        render(view:"../admin.Template/usersRegisteredToday", model: [totalUserSignupToday : totalUserSignupToday])
    }

    def switchUser(){

    }

    def home(){
        def users = User.getAll()

        [users:users]
    }

    def ajaxGetRegisteredUser = {

        def results  = User.executeQuery("select dateCreated as date ,count(id) from User group by dateCreated")
        List<ChartData> chartDataList = new ArrayList<>()
        results.each { result->
            Date date = result[0]
            Integer count=result[1]
            chartDataList.add(new ChartData(date: date.getTime(), count: count))
        }

        Map<Date,Integer> result = chartDataList.collectEntries{
            [it.date,it.count]
        }
        def json = new JsonBuilder()

        json(
                result.collect {
                    [
                            it.key,
                            it.value
                    ]
                }
        )

        render json.toPrettyString()
    }

    def browseUser(){

    }


    def searchUserDetails() {
        User user = User.findByUsername(params.username)
        [user:user]
    }

}
