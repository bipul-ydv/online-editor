<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

</head>

<body>


<div>
    <h2>Password Reset</h2>

    <p>
        You've forgotten your password. It's easily solved though.<br/>
        Just enter the email address or username you have registered with and we will send you a link to reset your password.
    </p>
    <g:form action="processForgottenPassword">
        <g:if test="${flash.message}">
            ${flash.message}
        </g:if>
        <g:if test="${flash.error}">
            ${flash.error}
        </g:if>
        <g:textField name="email" placeholder="Email"/>
        <input type="submit"  value="Send" />
    </g:form>



</div>
</body>
</html>