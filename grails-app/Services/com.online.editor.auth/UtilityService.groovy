package com.online.editor.auth


class UtilityService {

    def validateObjectAndSave(String message, Object object) {
        if (object?.validate()) {
            object.save()
        } else {
            object?.discard()
            object?.errors?.allErrors?.each {
                log.debug it
            }
            throw new ValidationException(message, object)
        }
    }
}