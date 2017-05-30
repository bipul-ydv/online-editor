<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

</head>

<body>
<g:if test="${flash.message}">
    <div class="message" role="status" style="font-size: medium;color: green;">${flash.message}</div>
</g:if>
<g:if test="${flash.error}">
    <div class="message_error" style="font-size: medium;color: red;">${flash.error}</div>
</g:if>
<g:if test = "${flash.warning}">
    <div style="font-size: medium;color: red;">${flash.warning}</div>
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