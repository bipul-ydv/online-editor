<%@ page contentType="text/html" %>
<head>
   <title>Reset Password</title>
</head>
<body>
<h2>Hi ${fullName}</h2>

<g:form controller="user" action="changePassword">
To Reset Your Password <a href="${verificationLink}"> Click here </a>
</g:form>

</body>
</html>