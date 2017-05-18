<!DOCTYPE html>
<html>
<head>

    <asset:stylesheet src="login.css"></asset:stylesheet>
    <style>
    body {
        background-image: url("${resource(dir:'images', file:'online-editor1.jpg')}");
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
    }
    </style>
</head>
<body>

<div class="container">
    <div class="card card-container">

        <g:form class="form-signin" controller="user" action="saveNewPassword">

            <g:if test="${flash.message}">
                ${flash.message}
            </g:if>
            <g:if test="${flash.error}">
                ${flash.error}
            </g:if>
            <input type="hidden" value="${uuid}" name="uuid" />

            <span id="reauth-email" class="reauth-email"></span>

            <h4>Enter your New Password</h4>
            <input type="password" id="inputEmail" class="form-control" placeholder="New Password" name = "password"  autofocus>
            <input type="password" id="inputPassword" class="form-control" placeholder="Confirm New Password" name = "confirmPassword" >


            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Save</button>
        </g:form><!-- /form -->

    </div><!-- /card-container -->
</div>

</body>
</html>