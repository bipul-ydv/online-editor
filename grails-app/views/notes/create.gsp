<!Doctype html>
<html>
<head>
    <meta name="layout" content=""/>
    <title>new note</title>

<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
</head>
<body></body>
<div class="container" id="wrap">
    <div class="row">
            <legend>Make Notes</legend>

            <g:form action="save" method="POST">
                <div>
                    <g:textArea id="myField" name="myTextField" value="" style="width: 100%;" rows="25"/>
                </div>

                </br>
                    <button type="submit" name="Submit" value="Make Note">Make Note</button>
            </g:form>
    </div>
</div>
</div>
</html>
