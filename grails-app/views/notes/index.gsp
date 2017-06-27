<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'notes.label', default: 'Notes')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <style type="text/css">
    .trash { color:rgb(209, 91, 71); }
    .flag { color:rgb(248, 148, 6); }
    .panel- body { padding:0px; }
    .panel-footer .pagination { margin: 0; }
    .panel .glyphicon,.list-group-item .glyphicon { margin-right:5px; }
    .panel-body .radio, .checkbox { display:inline-block;margin:0px; }
    .panel-body input[type=checkbox]:checked + label { text-decoration: line-through;color: rgb(128, 144, 160); }
    .list-group-item:hover, a.list-group-item:focus {text-decoration: none;background-color: rgb(245, 245, 245);}
    .list-group { margin-bottom:0px; }
    .pagination>li>.currentStep {
        color: white;
        background-color: blueviolet;
    }
    .pagination>li>a{
        color: black;
    }

    .modal .modal-header {
        border-bottom: none;
        position: relative;
    }
    .modal .modal-header .btn {
        position: absolute;
        top: 0;
        right: 0;
        margin-top: 0;
        border-top-left-radius: 0;
        border-bottom-right-radius: 0;
    }
    .modal .modal-footer {
        border-top: none;
        padding: 0;
    }
    .modal .modal-footer .btn-group > .btn:first-child {
        border-bottom-left-radius: 0;
    }
    .modal .modal-footer .btn-group > .btn:last-child {
        border-top-right-radius: 0;
    }
    </style>
    <script type="application/javascript">
        $(function(){
            $('a[data-toggle="tooltip"]').tooltip();
        });

        function reply_click(clicked_id) {
            var idValue = clicked_id;
            console.log(idValue);
            document.getElementById("id").value = idValue;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">
                <strong> ${flash.message}</strong>
            </div>
        </g:if>
        <g:if test="${flash.warning}">
            <div class="alert alert-success" role="alert">
                <strong> ${flash.warning}</strong>
            </div>
        </g:if>
        <div class="">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-list"></span>Notes Lists
                </div>
                <div class="panel-body">
                    <ul class="list-group">
                        <g:each in="${usernotes}">
                            <li class="list-group-item">
                                <div class="checkbox">
                                    <a href="/notes/show/${it.first()}">
                                        <label for="checkbox">
                                            ${it.last()}
                                        </label>
                                    </a>
                                </div>
                                <span class=" pull-right action-buttons" style="text-decoration: none">
                                    <a href="/notes/edit/${it.first()}" data-toggle="tooltip" data-placement="top" title="Edit Note"><span class="glyphicon glyphicon-pencil"></span></a>
                                    <a href="/notes/show/${it.first()}" data-toggle="tooltip" data-placement="top" title="Show Note"><span class="glyphicon glyphicon-list-alt"></span></a>
                                    <a href="/notes/mailMe/${it.first()}" data-toggle="tooltip" data-placement="top" title="Mail Note"><span class="glyphicon glyphicon-envelope"></span></a>
                                    <a data-toggle="tooltip" data-placement="top" title="Delete"><button type="button" class="btn btn-link" data-toggle="modal" onclick="reply_click(this.value)" value="${it.first()}" data-target="#modalOnoff" style="padding: 0px"><i class="glyphicon glyphicon-trash"></i></button></a>
                                </span>
                            </li>
                        </g:each>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-6">
                            <h6>
                                Total Count <span class="label label-info">${notesCount}</span></h6>
                        </div>
                        <div class="col-md-6">
                            <ul class="pagination pagination-sm pull-right">
                                <div class="pagination">
                                    <li><g:paginate total="${notesCount ?: 0}" /></li>
                                </div>
                            </ul>
                        </div>
                        <div class="modal fade bs-example-modal-lg" id="modalOnoff" tabindex="-1" role="dialog" aria-labelledby="lbOnoff">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <h4 class="modal-title" id="lbOnoff">Delete Notes</h4>
                                    </div>

                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p>Are you Sure, you want to delete..?</p>
                                                <hr>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                                <g:form name="delete_note" action="delete" method="DELETE"  style="display:inline;">
                                                    <g:hiddenField id="id" name="id" value=""/>
                                                    <g:hiddenField name="offset" value="${params.offset}"/>
                                                    <button id="delButton" class="btn btn-danger"  type="submit" action="delete">Delete</button></a>
                                                </g:form>
                                                <p class="text-center"><span class="text-muted"></span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>