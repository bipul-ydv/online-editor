<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
    <g:set var="entityName" value="${message(code: 'online-editor.label', default: 'Online-Editor')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>

    <script>
        function goBack(){
            window.history.back();
        }
    </script>

    <style>

    .error-template {
        padding: 40px 15px;text-align: center;
    }
    .error-actions {
        margin-top:15px;margin-bottom:15px;
    }
    .error-actions .btn {
        margin-right:10px;
    }

    </style>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">

                <h2>
                    500 Service Unavailable</h2>
                <div class="error-details">
                    Sorry, an error has occured, Requested page not found!
                </div>
                <div class="error-actions">
                    <a onclick="goBack()" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                        Take Me Home </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

