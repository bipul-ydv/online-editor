<!Doctype html>
<html>
<head>
    <meta name="layout" content=""/>
    <title>edit note</title>

<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
</head>
<body></body>
<div class="container" id="wrap">
    <div class="row">
        <legend>Make Notes</legend>

        <g:form url="[resource:notes, action:'update']" method="PUT">
            <div>
                <g:textArea id="myTextField" name="myTextField" value="${notes?.myTextField}" style="width: 100%;" rows="25"/>
            </div>

            </br>
            <button type="submit" name="Submit" value="Submit">Update</button>
        </g:form>
    </div>
</div>
</div>
</html>

