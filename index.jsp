<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Socrates Home</title>
</style>
</head>
<body>
	<h1>Login to Socrates</h1>
	<form action="login" method="post">
		<fieldset>
		<label for="username">Username:</label>
		<input type="text" id="username" name="username" placeholder="Enter Username" required />
		<br/><br/>
		<label for="password">Password:</label>
		<input type ="password" id="password" name = "password" placeholder="Enter password" required />
		<br/><br/>
		<input type="submit" value="Login" />
		<input type="button" Value="New User??" onclick="location.href = 'registration';" />
		</fieldset>
	</form>
		
</body>
</html>