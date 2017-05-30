<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="" />
    <g:set var="entityName" value="${message(code: 'notes.label', default: 'Notes')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

    .trash { color:rgb(209, 91, 71); }
.flag { color:rgb(248, 148, 6); }
.panel-body { padding:0px; }
.panel-footer .pagination { margin: 0; }
.panel .glyphicon,.list-group-item .glyphicon { margin-right:5px; }
.panel-body .radio, .checkbox { display:inline-block;margin:0px; }
.panel-body input[type=checkbox]:checked + label { text-decoration: line-through;color: rgb(128, 144, 160); }
.list-group-item:hover, a.list-group-item:focus {text-decoration: none;background-color: rgb(245, 245, 245);}
.list-group { margin-bottom:0px; }
</style>
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
                    text-decoration: none;
                    "></form>
                </li>
            </sec:ifLoggedIn>
        </ul>
    </div>
</nav>



    <div class="container">
        <div class="row">
            <div class="">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-list"></span>Notes Lists
                    </div>
                    <div class="panel-body">
                        <ul class="list-group">

                                        <g:each in="${notesList}">
                                            <li class="list-group-item">
                                                <div class="checkbox">
                                                <a href="/notes/show/${it.id}">
                                                    <label for="checkbox">
                                                       ${it.myTextField}
                                                    </label>
                                                    </a>
                                                </div>
                                            <div class="pull-right action-buttons">
                                                <a href="/notes/edit/${it.id}" title="Edit Note"><span class="glyphicon glyphicon-pencil"></span></a>
                                                <a href="/notes/delete/${it.id}"  title="Delete Note" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                                                %{--<a href="/notes/delete/${it.id}"  title="Delete Note" class="trash">--}%
                                                %{--<g:form  url="[resource:it]" method="DELETE">--}%
                                                    %{--<g:actionSubmit class="btn btn-link" type="submit" value="Delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
                                                %{--</g:form>--}%
                                                <a href="/notes/show/${it.id}" title="Show Note"><span class="glyphicon glyphicon-list-alt"></span></a>
                                                <g:link controller="notes" title="Mail this Note" action="mailMe" resource="${it}"><span class="glyphicon glyphicon-envelope"></g:link>
                                            </div>
                                        </g:each>
                                </div>

                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-md-6">
                                <h6>
                                    Total Count <span class="label label-info">25</span></h6>
                            </div>
                            <div class="col-md-6">
                                <ul class="pagination pagination-sm pull-right">
                                    <li class="disabled"><a href="javascript:void(0)">«</a></li>
                                    <li class="active"><a href="javascript:void(0)">1 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="http://www.jquery2dotnet.com">2</a></li>
                                    <li><a href="http://www.jquery2dotnet.com">3</a></li>
                                    <li><a href="http://www.jquery2dotnet.com">4</a></li>
                                    <li><a href="http://www.jquery2dotnet.com">5</a></li>
                                    <li><a href="javascript:void(0)">»</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





   %{-- <div class="container">
        <div class="row">
            <div class="">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-list"></span>Notes Lists
                    </div>
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <div class="checkbox"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>--}%


    %{--<div id="list-notes" class="content scaffold-list" role="main">--}%
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            %{--<g:if test="${flash.message}">--}%
                %{--<div class="message" role="status">${flash.message}</div>--}%
            %{--</g:if>--}%
            %{--<f:table collection="${notesList}" />--}%

            %{--<div class="pagination">--}%
                %{--<g:paginate total="${notesCount ?: 0}" />--}%
            %{--</div>--}%
        %{--</div>--}%
    </body>
</html>
