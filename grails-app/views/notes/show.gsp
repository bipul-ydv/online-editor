<!Doctype html>
    <html>
    <head>
            <meta name="layout" content="" />
<g:set var="entityName" value="${message(code: 'notes.label', default: 'Notes')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<meta name="layout" content=""/>
<title>edit note</title>
<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css">
%{--<style type="text/css">
a {
    color: #fff;
}
</style>--}%
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
        <li><g:link class="create" action="create">New Note</g:link></li>
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
    %{--<legend>Make Notes</legend>--}%
        <g:if test="${flash.message}">
            <div class="message" role="status" style="color: blue">${flash.message}</div>
        </g:if>
        <g:form url="[resource:notes]" method="DELETE">
            <div>
                <g:textArea class="form-control"  placeholder="Start Here" id="myTextField" name="myTextField" value="${notes?.myTextField}" style="width: 100%;" rows="25" disabled="true"/>
            </div>
            </br>
            <button class="btn btn-primary"><g:link action="edit"style="color: #fff;text-decoration: none;" resource="${this.notes}"><g:message code="default.button.edit.label" default="Edit"/></g:link></button>
            <button class="btn btn-info"><g:link  action="mailMe" style="color: #fff;text-decoration: none;" resource="${this.notes}">Mail This Note</g:link></button>
            <g:actionSubmit class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </g:form>
    </div>
</div>
</html>
