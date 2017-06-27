<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

    %{--<link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css">--}%
    %{--<link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'jquery-2.2.0.min.js')}" type="application/javascript">--}%
    %{--<link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'bootstrap.min.js')}" type="application/javascript">--}%
</head>
<body>%{--
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
            <li><g:link controller="notes" action="index">List Note</g:link></li>
            <li><g:link controller="user" action="showProfile">My Profile</g:link></li>
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
--}%
<div class="container-fluid">
    <h3 class="page-header">Edit Profile</h3>

    <div class="row">
        <!-- left column -->
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="text-center">
                <img src="${user?.imageUrl}" class="avatar img-circle img-thumbnail" alt="avatar">                %{--<h6>Upload a different photo...</h6>--}%
                %{--<input type="file" class="text-center center-block well well-sm">--}%
            </div>
        </div>
        <!-- edit form column -->
        <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
            %{--<div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a>
                <i class="fa fa-coffee"></i>
                This is an <strong>.alert</strong>. Use this to show important messages to the user.
            </div>--}%
        <g:if test="${flash.message}">
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a>
                <i class="fa fa-coffee"></i>
                <strong>${flash.message}</strong>
            </div>
        </g:if>
            <h3>Personal info</h3>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-3 control-label">Username:</label>
                    <div class="col-md-8">
                        <input class="form-control" value="${user?.username}" type="text"  disabled="true">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">First name:</label>
                    <div class="col-lg-8">
                        <input class="form-control" value="${user?.firstname}" type="text"  disabled="true">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Last name:</label>
                    <div class="col-lg-8">
                        <input class="form-control" value="${user?.lastname}" type="text"  disabled="true">
                    </div>
                </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Street:</label>
                        <div class="col-lg-8">
                            <input class="form-control" value="${user?.street}" type="text"  disabled="true">
                        </div>
                    </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">City:</label>
                    <div class="col-lg-8">
                        <input class="form-control" value="${user?.city}" type="text"  disabled="true">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Date Of Birth:</label>
                    <div class="col-lg-8">
                        <input class="form-control" value="${user?.dob}" type="text"  disabled="true">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-8">
                        <g:link controller="user" action="editProfile"><button type="button" class="btn btn-primary ">Edit Profile</button></g:link>
                        <span></span>
                        <g:link controller="notes" action="index"><button type="button" class="btn btn-default"><g:message code="default.button.cancel.label" default="Cancel"/></button></g:link>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

