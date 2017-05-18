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
        <form class="form-signin" action="processForgottenPassword">
            <g:if test="${flash.message}">
                ${flash.message}
            </g:if>
            <g:if test="${flash.error}">
                ${flash.error}
            </g:if>
            <P>
                Enter your Email id you have used while signup.We will send you link to change your password.
            </P>
            <span id="reauth-email" class="reauth-email"></span>

            <input type="email" id="inputEmail" class="form-control" placeholder="Email" name="email" required autofocus>

            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Continue</button>
        </form><!-- /form -->

    </div><!-- /card-container -->
</div>

</body>
</html>

