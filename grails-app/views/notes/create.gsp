<!Doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>new note</title>
</head>
<body>
<div class="container" id="wrap">
    <div class="row" style="margin-bottom: 10px;">
        <g:if test="${flash.warning}">
            <div class="alert alert-success" role="alert">
                ${flash.warning}
            </div>
        </g:if>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">
                ${flash.message}
            </div>
        </g:if>
        </div>
        <g:form action="save" method="POST" enctype='multipart/form-data'>
            <div>
                <g:textArea class="form-control" placeholder="Start Here" id="myField" name="myTextField" value="" style="width: 100%;" rows="25"/>
                %{--<input class="inputFiles" type="file" name="fileupload" multiple="multiple" accept="image/*" />--}%
            </div>
            </br>
            <button type="submit" class="btn btn-primary" name="Submit" value="Make Note">Save Note</button>
            <g:link action="index" style="color: #fff;text-decoration: none;padding-bottom: 25px"><button type="button" class="btn btn-danger"><g:message code="default.button.cancel.label" default="Cancel"/></button></g:link>
        </g:form>
    </div>
</div>
</div>
</body>
</html>
