<!Doctype html>
<html>
<head>
    <meta name="layout" content=""/>
    <title>new note</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css">
<link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'jquery-2.2.0.min.js')}" type="application/javascript">
<link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'bootstrap.min.js')}" type="application/javascript">
<script>
    var fade_out = function() {
        $("#myDiv").fadeOut().empty();
    }

    setTimeout(fade_out, 3000);
</script>
</head>


<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Online Editor</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><g:link action="index">List Note</g:link></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <sec:ifLoggedIn>
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
            </sec:ifLoggedIn>
        </ul>
    </div>
</nav>




</body>
<div class="container" id="wrap">
    <div class="row">
    %{--<div id="myDiv">--}%
    %{--<h4>Make Notes</h4></div>--}%
        <g:if test="${flash.warning}">
            <div class="message" role="status" style="color:Red;">${flash.warning}</div>
        </g:if>
        <g:form action="save" method="POST">
            <div>
                <g:textArea class="form-control" placeholder="Start Here" id="myField" name="myTextField" value="" style="width: 100%;" rows="25"/>
            </div>
            </br>
            <button type="submit" class="btn btn-primary" name="Submit" value="Make Note">Save Note</button>
        </g:form>
    </div>
</div>
</div>
</html>
