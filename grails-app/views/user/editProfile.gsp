<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content=""/>

    <link rel="stylesheet" href="${resource(dir: 'assets/stylesheets', file: 'bootstrap.css')}" type="text/css">
    <link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'jquery-2.2.0.min.js')}" type="application/javascript">
    <link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'bootstrap.min.js')}" type="application/javascript">
    <link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'bootstrap.min.js')}" type="application/javascript">
    <link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'npm.js')}" type="application/javascript">
    <link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'main.js')}" type="application/javascript">
    <link rel="javascript" href="${resource(dir: 'assets/javascripts', file: 'jquery.cropit.js')}" type="application/javascript">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <asset:javascript src="application.js"/>
    <asset:javascript src="jquery.cropit.js"/>

    <style type="text/css">
    .cropit-preview {
        background-color: #f8f8f8;
        background-size: cover;
        border: 5px solid #ccc;
        border-radius: 3px;
        margin-top: 7px;
        width: 250px;
        height: 250px;
    }

    .cropit-preview-image-container {
        cursor: move;
    }

    .cropit-preview-background {
        opacity: .2;
        cursor: auto;
    }

    .image-size-label {
        margin-top: 10px;
    }

    input, .export {
        /* Use relative position to prevent from being covered by image background */
        position: relative;
        z-index: 10;
        display: block;
    }

    button {
        margin-top: 10px;
    }
    </style>

    <script>

        $(function() {

            $( document ).ready(function() {
                var imageVal = document.getElementById("myimage1").value;
                var dataUrl = imageVal.toDataURL();
                console.log(dataUrl);
                console.log(imageVal)
            });


            $('.image-editor').cropit({
                exportZoom: 1.25,
                imageBackground: true,
                imageBackgroundBorderWidth: 20
            });

            $('.rotate-cw').click(function() {
                $('.image-editor').cropit('rotateCW');
            });
            $('.rotate-ccw').click(function() {
                $('.image-editor').cropit('rotateCCW');
            });

            $('.export').click(function() {
                var imageData = $('.image-editor').cropit('export');
                document.getElementById("imageValue").value = imageData;
                console.log(imageData);
            });

            $('.export1').click(function() {
                var imageData = $('.image-editor').cropit('export');
                document.getElementById("imageValue").value = imageData;
                console.log(imageData);
            });


        });

    </script>

</head>

<body>

%{--
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
            <li><g:link class="" controller="notes" action="create">New Note</g:link></li>
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
                    ">
                </form>
                </li>
            </sec:ifLoggedIn>
        </ul>
    </div>
</nav>--}%

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
            <li><g:link class="create" controller="notes" action="create">New Note</g:link></li>
            <li><g:link controller="notes" action="index">List Note</g:link></li>
            <li><g:link controller="user" action="showProfile">My Profile</g:link></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <sec:ifLoggedIn>
                <li><form name="logout" method="POST" action="${createLink(controller:'logout') }">
                    %{--<span class="glyphicon glyphicon-log-out"></span>--}%
                    <li class="glyphicon glyphicon-log-out"></li>
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

<div class="container-fluid">
    <h3 class="page-header">Edit Profile</h3>
    <div class="row">
    <!-- left column -->
        <g:form class="form-horizontal" role="form" action="updateProfile" method="POST" enctype='multipart/form-data'>
%{--

            <div id="result"></div>
            <g:hiddenField id="imageValue" name="id" value=""/>
            <button type="submit" class="btn btn-primary" name="Submit" value="Submit">Save Changes</button>

--}%




            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="text-center col-sm-offset-1">
                    <div class="image-editor">
                        <div class="cropit-preview"><strong>Choose file for preview</strong>
                    </div>
                        </br>
                            <input type="file" class="cropit-image-input">
                        <div class="image-size-label col-sm-8">
                            Resize <image></image>
                            <input type="range" class="cropit-image-zoom-input">
                            <button type="button"  class="rotate-ccw btn btn-primary">Rotate Right</button>
                            <button type="button" class="rotate-cw btn btn-primary">Rotate Left</button>
                            <button type="button" class="export btn btn-primary" style="display: none">Export</button>
                        </div>
                    </div>
                    <div id="edfhj">
                            <div id="result"></div>
                            <g:hiddenField class="inputFiles" type="file" id="imageValue" name="fileupload" value="${user.imageUrl}" accept="image/*" />
                    </div>

                </div>
            </div>
            <!-- edit form column -->
            <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
            <h3>Personal info</h3>
            <div class="form-group">
                <label class="col-md-3 control-label">Username:</label>
                <div class="col-md-8">
                    <input class="form-control" name="username" value="${user?.username}" type="text" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">First name:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="firstname" value="${user?.firstname}" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Last name:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="lastname" value="${user?.lastname}" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Street:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="street" value="${user.street}" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">City:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="city" value="${user.city}" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Date Of Birth:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="dob" value="${user.dob}" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">
                    <button type="submit" class="btn btn-primary export1" name="Submit" value="Submit" >Save Changes</button>
                    <span></span>
                    <g:link controller="user" action="showProfile"><button type="button" class="btn btn-default"><g:message code="default.button.cancel.label" default="Cancel"/></button></g:link>
                </div>
            </div>
        </g:form>
    </div>
    </div>
</div>
</body>
</html>
