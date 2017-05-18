<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
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
<g:if test="${flash.message}">
    ${flash.message}
</g:if>
<g:if test="${flash.error}">
    ${flash.error}
</g:if>
        <div >
            <h5>Password reset confirmation sent successfully!</h5>
        </div>

    <div >
        <p>
            We’ve sent an email to <b>${email}</b> containing a temporary link to reset your password.
    </div>

</body>
</html>