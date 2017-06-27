<html>
<head>
	<meta name="layout" content="main" />

	<%
		response.setHeader("Cache-Control","no-cache");

		response.setHeader("Cache-Control","no-store");

		response.setDateHeader("Expires", 0);

		response.setHeader("Pragma","no-cache");

	%>
	<title><g:message code='springSecurity.login.title'/></title>
	<asset:stylesheet src="login.css"></asset:stylesheet>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<style type='text/css'>

</style>
</head>

<body>

<div class="container">
	<div class="row">
		<div class="col-sm-6 col-md-4 col-md-offset-4" >
			<h1 class="text-center login-title">Sign in to continue to Online-Editor</h1>
			<div class="account-wall">
				<img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
					 alt="">
				<form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" >
					<g:if test='${flash.message}'>
				    <div class="login_message">${flash.message}</div>
			        </g:if>
					<g:if test="${flash.error}">
						${flash.error}
			       </g:if>
					<input type="text" class="form-control" placeholder="Username" id="username" name="${usernameParameter ?: 'username'}" required autofocus>
					<br>
					<input type="password" class="form-control" placeholder="Password" name="${passwordParameter ?: 'password'}"  id="password" required>
					<button class="btn btn-lg btn-primary btn-block" id="submit" type="submit">
						Sign in</button>
					<p id="remember_me_holder">
						<input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
						<label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
					</p>
					<a href="${createLink(controller:'user', action:'forgotPassword')}" class="pull-right need-help">Forgot the Password? </a><span class="clearfix"></span>
					<a href="${createLink(controller:'user', action:'index')}"  class="pull-right need-help">Don't have an account? SignUp </a><span class="clearfix"></span>

				</form>

			</div>

		</div>
	</div>
</div>

</div>
</div>
<script>
(function() {
	document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
})();
</script>
</body>
</html>

