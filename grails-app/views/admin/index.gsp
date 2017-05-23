
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content = "width = device-width,initial state = 1" >
    <asset:stylesheet src="bootstrap.css"></asset:stylesheet>
    <asset:stylesheet src = "jquery-2.2.0.min.js"></asset:stylesheet>
    <asset:stylesheet src = "bootstrap.js"></asset:stylesheet>

    <style>

    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class = "navbar-header"></div>
    <a class="navbar-brand">Online-Editor</a>
    <ul class="nav navbar-nav">
    <li><a href = "#">Home</a></li>
    <li><a href = "#">AboutUs</a></li>
    <li><a href = "#">ContactUs</a></li>
    </ul>

</nav>
<div class="container" >
    <div class = "row jumbotron">
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Admin Access
                </div>
                <div class="panel-body">
                    <p><a href="/admin/allUserInfo">Browse Users</a></p>
                    <p>UserChart</p>
                    <p><a href="/admin/switchUser">Switch as a user</a> </p>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>DOB</th>
                    <th>City</th>
                    <th>Street</th>
                    <th>Gender</th>
                    <th>DateCreated</th>
                </thead>
                </tr>
            <tbody>
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
                    </tbody>
                </g:each>
            </table>
        </div>
    </div>
</div>


</body>
</html>