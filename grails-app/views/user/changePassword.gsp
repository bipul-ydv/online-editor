<!DOCTYPE html>
<html>
<head>

    <asset:stylesheet src="login.css"></asset:stylesheet>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <style>

    </style>
</head>
<body>

<nav class="navbar navbar-default">
    <div class = "navbar-header"></div>
    <a class="navbar-brand">Online-Editor</a>
</nav>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4" >
            <h1 class="text-center login-title">Enter Your New Password</h1>
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                     alt="">
                <g:form class="form-signin" action="saveNewPassword">
                    <g:if test="${flash.message}">
                        <div class="message" role="status" style="font-size: medium;color: green;">${flash.message}</div>
                    </g:if>
                    <g:if test="${flash.error}">
                        <div class="message_error" style="font-size: medium;color: red;">${flash.error}</div>
                    </g:if>
                    <input type="hidden" value="${uuid}" name="uuid" />
                    <input type="password" class="form-control" placeholder="Password" name = "password" required autofocus>
                    <br>
                    <input type="password" class="form-control" placeholder="Confirm Password" name="confirmPassword" required>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                        Save</button>
                </g:form>

            </div>

        </div>
    </div>
</div>

</body>
</html>