
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Administration panel</title>
<link rel="stylesheet" type="text/css" href="/css/login_admin.css" />
</head>
<body>
<div class="container">
	<section id="content">
		<form action='admin.php?make=auth' method='POST'>
			<h1>Log In</h1>
			<div>
				<input type="text" placeholder="Login" name='name' required="" id="username" />
			</div>
			<div>
				<input type="password" placeholder="Password" name='pass' required="" id="password" />
			</div>
			<div>
				<input type="submit" value="Log In" />
<!--				<a href="#">Lost your password?</a>
				<a href="#">Register</a>-->
			</div>
		</form><!-- form -->

	</section><!-- content -->
</div><!-- container -->
</body>
</html>
<!--<div class="admin_wrapper">
    <div class="auth_form">
        <form action='admin.php?make=auth' method='POST'>

        <input type='text' name='name' onblur="this.value==''?this.value='Login':void(0)" onfocus="this.value=='Login'?this.value='':void(0)" value="Login" /> <br />
<br>
        <input type='password' name='pass' onblur="this.value==''?this.value='Password':void(0)" onfocus="this.value=='Password'?this.value='':void(0)" value="Password" /> <br />
<br>
        <input type='submit' value='Log In' /> <br /><br />

        <a href='admin.php?make=get_pass_form'>Recovery Password</a>
    </div>
</div>-->
