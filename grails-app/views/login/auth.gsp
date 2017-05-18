<html>
<head>

	<title><g:message code='springSecurity.login.title'/></title>
	<asset:stylesheet src="login.css"></asset:stylesheet>
	<style type='text/css'>
	 .h2{
		 text-align: center;
	}
     body {
         background-image: url("${resource(dir:'images', file:'online-editor1.jpg')}");
         background-repeat: no-repeat;
         background-attachment: fixed;
         background-position: center;
     }
</style>
</head>

<body>

<div class="h2">
<h2>Online-Editor</h2>
</div>
<div class="container">
	<div class="card card-container">
		<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
		<img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
		<p id="profile-name" class="profile-name-card"></p>


		<form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="form-signin">
			<g:if test='${flash.message}'>
				<div class="login_message">${flash.message}</div>
			</g:if>
			<g:if test="${flash.error}">
				${flash.error}
			</g:if>
			<p>
				<label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
				<input type="text" class="form-control" placeholder="username" required autofocus name="${usernameParameter ?: 'username'}" id="username"/>
			</p>

			<p>
				<label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
				<input type="password" class="form-control" placeholder="Password" required name="${passwordParameter ?: 'password'}" id="password"/>
			</p>

			<p id="remember_me_holder">
				<input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
				<label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
			</p>

			<p>
				<input type="submit"class="btn btn-lg btn-primary btn-block btn-signin" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
			</p>
		</form>
		<a href="${createLink(controller:'user', action:'forgotPassword')}" class="forgot-password">
			Forgot the password?
		</a>
		<p>
		<a href="${createLink(controller:'register', action:'index')}" class="forgot-password">
			Don't have an account?Signup
		</a>
		</p>
	</div>
</div>
<script>
(function() {
	document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
})();
</script>
</body>
</html>
