<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="container-fluid">
    <h3 class="page-header">Edit Profile</h3>
    <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="text-center">
                <img src="${user?.imageUrl}" class="avatar img-circle img-thumbnail" alt="avatar">
            </div>
        </div>
        <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
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

