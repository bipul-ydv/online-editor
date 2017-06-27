<!doctype html>
<html lang="en" class="no-js">
<head>
    %{--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>--}%
    %{--<meta http-equiv="X-UA-Compatible" content="IE=edge"/>--}%
    %{--<title>--}%
        %{--<g:layoutTitle default="Grails"/>--}%
    %{--</title>--}%
    %{--<meta name="viewport" content="width=device-width, initial-scale=1"/>--}%

    %{--<asset:stylesheet src="application.css"/>--}%

    <g:layoutHead/>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
%{--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--}%
<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css">
<link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'jquery-2.2.0.min.js')}" type="application/javascript">
%{--<link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'bootstrap.min.js')}" type="application/javascript">--}%
</head>
<body>

%{--
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/#">
                <i class="fa grails-icon">
                    <asset:image src="grails-cupsonly-logo-white.svg"/>
                </i> Grails
            </a>
        </div>
        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">
                <g:pageProperty name="page.nav" />
            </ul>
        </div>
    </div>
</div>
--}%



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
            <sec:ifLoggedIn>
            <li><g:link class="create" controller="notes" action="create">New Note</g:link></li>
            <li><g:link controller="notes" action="index">List Note</g:link></li>
            <li><g:link controller="user" action="showProfile">My Profile</g:link></li>
            </sec:ifLoggedIn>
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
            <sec:ifNotLoggedIn>
            <li><g:link controller="user" action="index">Register</g:link></li>
            <li><g:link controller="user" action="showProfile">Login</g:link></li>
            </sec:ifNotLoggedIn>
        </ul>
    </div>
</nav>

<g:layoutBody/>

%{--
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
--}%

%{--<asset:javascript src="application.js"/>--}%

</body>
</html>