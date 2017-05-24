    <!Doctype html>
    <html>
    <head>
    <meta name="layout" content=""/>
    <title>edit note</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <body></body>
    <div class="container" id="wrap">
        <div class="row">
            <legend>Make Notes</legend>
            <g:if test="${flash.message}">
                <div class="message" role="status" style="color: blue">${flash.message}</div>
            </g:if>
            <g:form url="[resource:notes]" method="DELETE">
                <div>
                    <g:textArea id="myTextField" name="myTextField" value="${notes?.myTextField}" style="width: 100%;" rows="25" disabled="true"/>
                </div>
                </br>
                <g:actionSubmit class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                <button><g:link class="edit" action="edit" resource="${this.notes}"><g:message code="default.button.edit.label" default="Edit" /></g:link></button>
                <button><g:link class="" action="mailMe" resource="${this.notes}">Mail My Note</g:link></button>
                <button><g:link class="create" action="create">New Note</g:link></button>
            </g:form>
        </div>
    </div>
    </div>
    </html>
