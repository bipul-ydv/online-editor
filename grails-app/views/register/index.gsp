<!doctype html>
<html>
<head>
    <meta name="layout" content=""/>
    <title>Welcome to Grails</title>

<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/css">
#wrap{
background-image: -ms-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* Mozilla Firefox */
background-image: -moz-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* Opera */
background-image: -o-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* Webkit (Safari/Chrome 10) */
background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #FFFFFF), color-stop(1, #D3D8E8));
/* Webkit (Chrome 11+) */
background-image: -webkit-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* W3C Markup, IE10 Release Preview */
background-image: linear-gradient(to bottom, #FFFFFF 0%, #D3D8E8 100%);
background-repeat: no-repeat;
background-attachment: fixed;
}
legend{
 color:#141823;
 font-size:25px;
 font-weight:bold;
}
.signup-btn {
background: #79bc64;
background-image: -webkit-linear-gradient(top, #79bc64, #578843);
background-image: -moz-linear-gradient(top, #79bc64, #578843);
background-image: -ms-linear-gradient(top, #79bc64, #578843);
background-image: -o-linear-gradient(top, #79bc64, #578843);
background-image: linear-gradient(to bottom, #79bc64, #578843);
-webkit-border-radius: 4;
-moz-border-radius: 4;
border-radius: 4px;
text-shadow: 0px 1px 0px #898a88;
-webkit-box-shadow: 0px 0px 0px #a4e388;
-moz-box-shadow: 0px 0px 0px #a4e388;
box-shadow: 0px 0px 0px #a4e388;
font-family: Arial;
color: #ffffff;
font-size: 20px;
padding: 10px 20px 10px 20px;
border: solid #3b6e22  1px;
text-decoration: none;
}

.signup-btn:hover {
background: #79bc64;
background-image: -webkit-linear-gradient(top, #79bc64, #5e7056);
background-image: -moz-linear-gradient(top, #79bc64, #5e7056);
background-image: -ms-linear-gradient(top, #79bc64, #5e7056);
background-image: -o-linear-gradient(top, #79bc64, #5e7056);
background-image: linear-gradient(to bottom, #79bc64, #5e7056);
text-decoration: none;
}
.navbar-default .navbar-brand{
     color:#fff;
     font-size:30px;
     font-weight:bold;
 }
.form .form-control { margin-bottom: 10px; }
@media (min-width:768px) {
 #home{
     margin-top:50px;
 }
 #home .slogan{
     color: #0e385f;
     line-height: 29px;
     font-weight:bold;
 }
}
 </script>
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body></body>
<div class="container" id="wrap">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">

            <legend>Register Here</legend>

            <g:form action="create" method="POST">

                <g:if test="${flash.message}">
                    <div class="message" role="status" style="color:blue;">${flash.message}</div>
                </g:if>

                <input type="text" name="username" value="${userInstance?.username}" class="form-control input-md" placeholder="User Name"/></br>
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

                <input type="email" name="email" value="${userInstance?.email}" class="form-control input-md" placeholder="Email"/></br>
                 <g:hasErrors bean="${userInstance}" field="email">
                        <p style="color: darkred;"> <g:fieldError bean="${userInstance}" field="email"/></p>
                    </g:hasErrors>

                <input type="password" name="password" value="${userInstance?.password}" class="form-control input-md" placeholder="Password"/></br>
                 <g:hasErrors bean="${userInstance}" field="password">
                        <p style="color: darkred;"><g:fieldError bean="${userInstance}" field="password"/></p>
                    </g:hasErrors>

                <input type="password" name="confirm_password" value="${userInstance?.confirm_password}" class="form-control input-md" placeholder="Confirm Password"/></br>
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

                <div class="g-recaptcha" data-sitekey="6LetkSEUAAAAALH7vPOoQ0I6MQTywVMujf_ouGBZ"></div>
                </br>
                    <div class="col-sm-7 col-sm-offset-5 errorCode">
                    <button type="submit" name="Submit" value="Submit">Submit</button>
                    </div>
            </g:form>
        </div>
    </div>
</div>
</div>
</html>

