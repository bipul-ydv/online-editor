<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

%{--<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />--}%
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <style type="text/css">
   .navbar-default
    {color: black}
        </style>

<script src='https://www.google.com/recaptcha/api.js'></script>
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
                    "></form>
                </li>
            </sec:ifLoggedIn>
        </ul>
    </div>
</nav>
--}%



<div class="container" id="wrap">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-list"></span> Register Here
                </div>

                <div class="panel-body">
            %{--<legend>Register Here</legend>--}%

            <g:form action="create" method="POST">

                <g:if test="${flash.message}">
                    <div class="message" role="status" style="color:blue;">${flash.message}</div>
                </g:if>

                <input type="text" name="username" required value="${userInstance?.username}" class="form-control input-md" placeholder="User Name"/></br>
                    <g:hasErrors bean="${userInstance}" field="username">
                        <p style="color: darkred;"><g:fieldError bean="${userInstance}" field="username"/></p>
                    </g:hasErrors>


                <input type="text" name="firstname" value="${userInstance?.firstname}" class="form-control input-md" placeholder="First Name"/></br>
                    <g:hasErrors bean="${userInstance}" field="firstname">
                        <p style="color: darkred;"><g:fieldError bean="${userInstance}" field="firstname"/></p>
                    </g:hasErrors>

                <input type="text" name="lastname" value="${userInstance?.lastname}" class="form-control input-md" placeholder="Last Name"/></br>

                    <g:hasErrors bean="${userInstance}" field="lastname" >
                        <g:fieldError bean="${userInstance}" field="lastname" />
                    </g:hasErrors>



                <input type="text" name="dob" value="${userInstance?.dob}" class="form-control input-md" placeholder="DOB"/></br>
                 <g:hasErrors bean="${userInstance}" field="dob">
                        <p style="color: darkred;"><g:fieldError bean="${userInstance}" field="dob"/></p>
                    </g:hasErrors>

                <input type="text" name="street" value="${userInstance?.street}" class="form-control input-md" placeholder="Street"/></br>
                 <g:hasErrors bean="${userInstance}" field="street">
                        <p style="color: darkred;"><g:fieldError bean="${userInstance}" field="street"/></p>
                    </g:hasErrors>

                <input type="text" name="city" value="${userInstance?.city}" class="form-control input-md" placeholder="City"/></br>
                 <g:hasErrors bean="${userInstance}" field="city">
                        <p style="color: darkred;"> <g:fieldError bean="${userInstance}" field="city"/></p>
                    </g:hasErrors>

                <input type="email" name="email" required value="${userInstance?.email}" class="form-control input-md" placeholder="Email"/></br>
                 <g:hasErrors bean="${userInstance}" field="email">
                        <p style="color: darkred;"> <g:fieldError bean="${userInstance}" field="email"/></p>
                    </g:hasErrors>

                <input type="password" name="password" required value="${userInstance?.password}" class="form-control input-md" placeholder="Password"/></br>
                 <g:hasErrors bean="${userInstance}" field="password">
                        <p style="color: darkred;"><g:fieldError bean="${userInstance}" field="password"/></p>
                    </g:hasErrors>

                <input type="password" name="confirm_password" required value="${userInstance?.confirm_password}" class="form-control input-md" placeholder="Confirm Password"/></br>
                 <g:hasErrors bean="${userInstance}" field="confirm_password">
                        <p style="color: darkred;"> <g:fieldError bean="${userInstance}" field="confirm_password"/></p>
                    </g:hasErrors>

                <label>Gender : </label>
                <label class="radio-inline">
                <input type="radio" name="gender" value="Male" />Male</br>
                </label>
                <label class="radio-inline">
                <input type="radio" name="gender" value="Female" />Female</br>
                </label>
                    <g:hasErrors bean="${userInstance}" field="gender">
                        <p style="color: darkred;"><g:fieldError bean="${userInstance}" field="gender"/></p>
                    </g:hasErrors>

                <g:if test="${flash.warning}">
                    <div class="message" role="status" style="color: darkred">${flash.warning}</div>
                </g:if>
                <br><br>
                <div class="g-recaptcha" data-sitekey="6LetkSEUAAAAALH7vPOoQ0I6MQTywVMujf_ouGBZ" ></div>

                <br>
                    <div class="col-sm-7 col-sm-offset-5 errorCode">
                    <button type="submit" class="btn btn-primary" name="Submit" value="Submit">Submit</button>
                    </div>
            </g:form>
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>

