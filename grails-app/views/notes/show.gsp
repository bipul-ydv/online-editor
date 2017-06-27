<!Doctype html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'notes.label', default: 'Notes')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <title>edit note</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css" />


<style>
html, body {
    padding-top: 20px;
}

[data-role="dynamic-fields"] > .form-inline + .form-inline {
    margin-top: 0.5em;
}

[data-role="dynamic-fields"] > .form-inline [data-role="add"] {
    display: none;
}

[data-role="dynamic-fields"] > .form-inline:last-child [data-role="add"] {
    display: inline-block;
}

[data-role="dynamic-fields"] > .form-inline:last-child [data-role="remove"] {
    display: none;
}
    </style>


<script type="text/javascript">
    $(function() {
        // Remove button click
        $(document).on(
                'click',
                '[data-role="dynamic-fields"] > .form-inline [data-role="remove"]',
                function(e) {
                    e.preventDefault();
                    $(this).closest('.form-inline').remove();
                }
        );
        // Add button click
        $(document).on(
                'click',
                '[data-role="dynamic-fields"] > .form-inline [data-role="add"]',
                function(e) {
                    e.preventDefault();
                    var container = $(this).closest('[data-role="dynamic-fields"]');
                    new_field_group = container.children().filter('.form-inline:first-child').clone();
                    new_field_group.find('input').each(function(){
                        $(this).val('');
                    });
                    container.append(new_field_group);
                }
        );
    });

var copyTextareaBtn = document.querySelector('.js-textareacopybtn');
$(document).on('click', '.js-textareacopybtn', function () {
    var copyTextarea = document.querySelector('.js-copytextarea');

    copyTextarea.select();

    try {
        var successful = document.execCommand('copy');
        var msg = successful ? 'successful' : 'unsuccessful';
        console.log(msg);
        console.log('Copying text command was ' + msg);
    } catch (err) {
        console.log('Oops, unable to copy');
    }
});


$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
    </script>
</head>
<body>


<div class="container" id="wrap">
    <div class="row" style="margin-bottom: 10px;">

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

        <div>
            <g:textArea class="form-control"  placeholder="Start Here" id="myTextField" name="myTextField" value="${notes?.myTextField}" style="width: 100%;" rows="25" disabled="true"/>
        </div>
    </br>

        <sec:ifLoggedIn>
            <g:link action="edit" style="color: #fff;text-decoration: none;" resource="${this.notes}"><button class="btn btn-primary"><g:message code="default.button.edit.label" default="Edit"/></button></g:link>
            <g:link  action="mailMe" style="color: #fff;text-decoration: none;" resource="${this.notes}">  <button class="btn btn-info">Mail This Note</button></g:link>
            <a  data-placement="top" title="Share"><button  class="btn btn-primary" data-toggle="modal"  value="${this.notes}" data-target="#modaloff"><g:message code="default.button.share.label" args="Share"/></button></a>
            <a  data-placement="top" title="Delete"><button  class="btn btn-danger" data-toggle="modal"  value="${this.notes}" data-target="#modalOnoff"><g:message code="default.button.delete.label" args="Delete"/></button></a>
        </sec:ifLoggedIn>

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
                                <g:form name="delete_note" action="delete" method="DELETE" id="${notes.id}" style="display:inline;">
                                    <button id="delButton" class="btn btn-danger"  type="submit" action="delete">Delete</button></a>
                                </g:form>
                                <p class="text-center"><span class="text-muted"></span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        %{--test for sharing notes--}%
        <div class="modal fade bs-example-modal-lg" id="modaloff" tabindex="-1" role="dialog" aria-labelledby="lbOnoff">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="lbOnoff">Share Notes</h4>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <g:form name="share_note" action="share" method="POST" id="${notes.id}" style="display:inline;">
                                <p>Email Id :</p>
                                <div class="col-sm-12">

                                    <div data-role="dynamic-fields">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <label class="sr-only" for="field-name">Email Id</label>
                                                <input type="email" name="emailList" class="form-control input-md" id="field-name" placeholder="Email Id:" value="">
                                            </div>
                                            <span>-</span>
                                            %{--<div class="form-group">--}%
                                                %{--<label class="sr-only" for="field-value">Field Value</label>--}%
                                                %{--<input type="text" class="form-control" id="field-value" placeholder="Field Value">--}%
                                            %{--</div>--}%
                                            <select class="form-control" name="permission">
                                                <option name="allow" value="read">Read</option>
                                                <option name="allow" value="write">Write</option>
                                            </select>
                                            <button class="btn btn-danger" data-role="remove">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <button class="btn btn-primary" data-role="add">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </div>  <!-- /div.form-inline -->
                                    </div>
                                        <br/>

                                %{--<input type="email" class="" name="emailId" id="emailId">--}%
                                    %{--<select><option value="read">read</option><option value="write">write</option></select>--}%
                                    %{--<input type="button" value="Add" onclick="addInput('dynamicInput');" />--}%

                                    %{--<div class="radio">--}%
                                    %{--<label><input type="radio" name="allow" value="read">Read Only</label>--}%
                                %{--</div>--}%
                                  %{--<div class="radio">--}%
                                    %{--<label><input type="radio" name="allow" value="write">Read Write</label>--}%
                                %{--</div>--}%

                                    <div id="inputArea"></div>
                                    <div id="dynamicInput"></div>


                                </div>
                                <div class="col-sm-12">
                                %{--Shareable Url: <strong><input type="textarea"  id="shareUrl" value="${request.getRequestURL()}" style="width: 100%;-webkit-box-sizing: border-box;border: none;"></strong>create link for controller:notes,action:show,id:notes.id--}%
                                Shareable Url:
                                    <strong><textarea class="js-copytextarea form-control input-sm" style="width: 100%;text-decoration: none;display: inline-block;border: none;overflow: hidden;w: auto;outline: none;-webkit-box-shadow: none;-moz-box-shadow: none;box-shadow: none;" rows="1" readonly>${request.getRequestURL()}</textarea><i class="js-textareacopybtn glyphicon glyphicon-duplicate" data-toggle="tooltip" title="Copy To Clipboard"></i>
                                </strong>



                                    <hr>

                                </div>
                                <div class="col-sm-6">
                                    <br/>
                                    <button id="shareButton" class="btn btn-primary"  type="submit" action="share">Share</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                </div>
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
</body>
</html>
