<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Admin Panel</title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <asset:stylesheet src="bootstrap.min.css"></asset:stylesheet>
    <asset:javascript src="bootstrap.min.js"></asset:javascript>
    <!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    <asset:stylesheet src="admin.css"></asset:stylesheet>
    <asset:javascript src="admin.js"></asset:javascript>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.highcharts.com/stock/highstock.js"></script>
    <script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
    <style>
        #headerColor{

        }
    </style>
</head>
<body>
<nav class="navbar  navbar-fixed-top " role="navigation" style=" background-color: #f8f8f8;">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Online-Editor</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a href = "home">Home</a></li>
                <li><form name="logout" method="POST" action="${createLink(controller:'logout') }">
                    <span class="glyphicon glyphicon-log-out"></span>
                    <input class="btn-link " type="submit" value="Logout" style="
                    padding-top: 15px;
                    border-left-width: 0px;
                    border-top-width: 0px;
                    padding-right: 15px;
                    padding-left: 5px;
                    padding-bottom: 15px;
                    "></form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script>
    function callSignUp() {
        $.ajax({url: "/admin/signUpChart", success: function(result){
            $("#dataContainer").html(result);
        }});
    }
    function callSwitchUser() {
        $.ajax({url: "/admin/switchUser", success: function(result){
            $("#dataContainer").html(result);
        }});
    }
    function callBrowseUser() {
        $.ajax({url: "/admin/browseUser", success: function(result){
            $("#dataContainer").html(result);
        }});
    }

</script>
<div class="container-fluid">

    <div class="row row-offcanvas row-offcanvas-left">

        <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">

            <ul class="nav nav-sidebar">
                <li class="active"><a href="#"><h5>Admin Access</h5></a></li>
                <li><a onclick = "callSignUp()" href="#" target="_ext"><h5>User SignUp Chart</h5></a></li>
                <li><a onclick = "callSwitchUser()" href="#" target="_ext"><h5>Switch As a User</h5></a></li>
                <li><a onclick = "callBrowseUser()" href= "#" target="_ext"><h5>Browse User</h5></a></li>
                <li><a href="#"><h5>Edit User Details</h5></a></li>
            </ul>
            <ul class="nav nav-sidebar">


            </ul>


        </div><!--/span-->

        <div id="dataContainer" class="col-sm-9 col-md-10 main">

            <!--toggle sidebar button-->
            <p class="visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
            </p>

           <div class="row placeholders">
                <div class="col-xs-6 col-sm-3 placeholder text-center">

                    <h2><span class="text-muted" style="color:#428bca">Users Details</span></h2>
                </div>

            </div>

            <hr>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead id="headerColor">
                    <tr>
                        <th>UserName</th>
                        <th>Email</th>
                        <th>SignUp Date</th>
                        <th>DOB</th>
                        <th>City</th>
                        <th>Gender</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${users}" status="i" var="user">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user?.dateCreated.dateString}</td>
                            <td>${user.dob}</td>
                            <td>${user.city}</td>
                            <td>${user.gender}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>



        </div><!--/row-->
    </div>
</div><!--/.container-->


<!-- script references -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
