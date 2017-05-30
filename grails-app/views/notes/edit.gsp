<!Doctype html>
<html>
<head>
    <meta name="layout" content=""/>
    <title>edit note</title>

<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css">

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
            <li><g:link class="create" action="create">New Note</g:link></li>
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
    %{--<div id="myNote">--}%
    %{--<h4>Update Notes</h4></div>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:form url="[resource:notes, action:'update']" method="PUT">
            <div>
                <g:textArea class="form-control" placeholder="Start Here" id="myTextField" name="myTextField" value="${notes?.myTextField}" style="width: 100%;" rows="25"/>
            </div>

            </br>
            <button type="submit" class="btn btn-primary"  name="Submit" value="Submit">Update</button>
        </g:form>
    </div>
</div>
</div>
</html>
