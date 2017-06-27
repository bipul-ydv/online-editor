package online.editor

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "405"(view: '/405.gsp')
        "/"(controller: 'notes',action: 'index')
        "500"(view:'/500.gsp')
        "404"(view: '/404.gsp')
        "/resetPassword/$uuid"(controller: 'user', action: 'changePassword')
        "/api/ajaxGetRegisteredUser" controller: "admin", action: "ajaxGetRegisteredUser"
    }
}
