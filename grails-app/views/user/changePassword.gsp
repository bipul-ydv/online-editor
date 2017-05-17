<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

</head>

<body>
<g:if test="${flash.message}">
    ${flash.message}
</g:if>
<g:if test="${flash.error}">
    ${flash.error}
</g:if>

<h2>Enter your new Password</h2>
<g:form action = "saveNewPassword">

    <g:hiddenField name="uuid" value="${uuid}"/>
    <label for="password">New Password</label>
    <g:passwordField name="password"></g:passwordField>
    <label for="confirmPassword">Confirm New Password</label>
    <g:passwordField name="confirmPassword"></g:passwordField>
    <input type="submit" value="SaveNewPassword">
</g:form>

</body>
</html>