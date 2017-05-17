package com.online.editor.auth

/**
 * Created by parul on 16/5/17.
 */

class ValidationException extends RuntimeException {
    String message
    Object object

    public ValidationException(String message, Object o) {
        this.message = message
        this.object = o
    }

}
