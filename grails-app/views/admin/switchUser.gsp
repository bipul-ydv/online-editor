<html>
<head>

</head>
<body>

<sec:ifAllGranted roles='ROLE_SWITCH_USER'>
    <form action='/login/impersonate' method='POST'>
        Switch to user: <input type='text' name='username'/> <br/>
        <input type='submit' value='Switch'/>
    </form>

</sec:ifAllGranted >
</body>
</html>