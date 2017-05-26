<!DOCTYPE html>
<html>
<head>
    <asset:stylesheet src="login.css"></asset:stylesheet>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>


<nav class="navbar navbar-default">
    <div class = "navbar-header"></div>
    <a class="navbar-brand">Online-Editor</a>
</nav>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4" >
            <g:if test='${flash.message}'>
                ${flash.message}
            </g:if>
            <g:if test="${flash.error}">
                ${flash.error}
            </g:if>
            <div class="account-wall">
                <h4>Enter your email id you have used while signup</h4>
                <form class="form-signin" action="processForgottenPassword">
                    <input type="text" class="form-control" name = "email" placeholder="Email" required autofocus>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                        Continue</button>
                </form>

            </div>

        </div>
    </div>
</div>

</body>
</html>

