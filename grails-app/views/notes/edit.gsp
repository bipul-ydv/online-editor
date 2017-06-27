<!Doctype html>
</htm>
<head>
    <meta name="layout" content="main"/>
    <title>edit note</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css">

</head>
<body>

<div class="container-fluid">
<div class="container" id="wrap">
    <div class="row">
<g:if test="${flash.message}">
    <div class="alert alert-info alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a>
        <i class="fa fa-coffee"></i>
        <strong>${flash.message}</strong>
    </div>
</g:if>
<g:if test="${flash.warning}">
    <div class="alert alert-danger alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a>
        <i class="fa fa-coffee"></i>
        <strong>${flash.warning}</strong>
    </div>
</g:if>

<g:form url="[resource:notes, action:'update']" method="PUT">
    <div>
        <g:textArea class="form-control" placeholder="Start Here" id="myTextField" name="myTextField" value="${notes?.myTextField}" style="width: 100%;" rows="25"/>
    </div>

    </br>
    <button type="submit" class="btn btn-primary"  name="Submit" value="Submit">Update</button>
    <g:link action="index" style="color: #fff;text-decoration: none;"><button type="button" class="btn btn-danger"><g:message code="default.button.cancel.label" default="Cancel"/></button></g:link>
</g:form>
</div>
</div>
</div>
</div>
</body>
</html>
