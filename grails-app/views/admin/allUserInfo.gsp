<html>
<head>
    <style>
    table, th, td {
        border: 1px solid black;
    }
    </style>
</head>
<body>
<table>
<tr>
    <th>Username</th>
    <th>Email</th>
    <th>DOB</th>
    <th>City</th>
    <th>Street</th>
    <th>Gender</th>
    <th>DateCreated</th>
</tr>

<g:each in="${users}" status="i" var="user">
<tr>
    <td>${user.username}</td>
    <td>${user.email}</td>
    <td>${user.dob}</td>
    <td>${user.city}</td>
    <td>${user.street}</td>
    <td>${user.gender}</td>
    <td>${user?.dateCreated}</td>
</tr>
</g:each>
</table>
</body>
</html>