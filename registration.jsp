<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Socrates | Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>

<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic">
					<img src="images/Socrates.jpg" alt="IMG" width="75%">
				</div>

				<form class="login100-form validate-form" action="register" method="post" onsubmit ="return validateForm();">
					<span class="login100-form-title">
						Register to Socrates
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Full name is required">
						<input class="input100" type="text" id="name" name="name" placeholder="Full Name" required maxlength="30">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-address-card" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" id="username" name="username" placeholder="Username" required maxlength="30">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user-circle" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="text" id="password" name="password" placeholder="password" required maxlength="30">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-key" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter same password as above">
						<input class="input100" type="text" id="passwordconfirm" name="passwordconfirm" placeholder="Confirm Password" required maxlength="30">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-key" aria-hidden="true"></i>
						</span>
					</div>
					<span id = "passwordinvalidmessage" style="color:red"> </span>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" id="email" name="email" placeholder="Email" required maxlength="30">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					<span id = "emailinvalidmessage" style="color:red"> </span>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Register
						</button>
					</div>

					<div class="text-center p-t-36">
						<a class="txt2" href="index.jsp">
							Back to Login
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!--h1>Register to Socrates</h1>
	<form name="register" action="register" method="post" onsubmit ="return validateForm();">
		<fieldset>
		<table><tr><td><label for="name">Full Name:</label></td>
		<td><input type="text" id="name" name="name" placeholder="Enter Full Name" required /></td></tr>
		
		<tr><td><label for="username">Username:</label></td>
		<td><input type="text" id="username" name="username" placeholder="Enter Username" required /></td></tr>
		
		<tr><td><label for="password">Password:</label></td>
		<td><input type ="password" id="password" name = "password" placeholder="Enter your password" required /></td></tr>
		
		<tr><td><label for="password">Confirm Password:</label></td>
		<td><input type ="password" id="passwordconfirm" name = "passwordconfirm" placeholder="Enter password again" required /></td>
		<td><span id = "passwordinvalidmessage" style="color:red"> </span></td></tr>
		
		<tr><td><label for="email">Email ID:</label></td>
		<td><input type="text" id="email" name="email" placeholder="Enter EmailID" required /></td>
		<td><span id = "emailinvalidmessage" style="color:red"> </span></td></tr>
		<tr><td><br/></td></tr><tr><td><input type="submit" value="Register"/></td>
		<td><input type="button" value="Back to Login page" onclick="location.href = 'index.jsp';">
		</table>
		</fieldset>
	</form-->
	
	<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	
<!--===============================================================================================-->
	<script src="js/main.js"></script>


</body>
<script>
function validateForm() {
	console.log("Validate");
	var valid = false;
	var passwordvalid = confirmPassword();
	var mailValid = validateEmail();
	return passwordvalid && mailValid;
}

function confirmPassword() {  
  var pw = document.getElementById("password").value;  
  var confirmpw = document.getElementById("passwordconfirm").value;  
  //check empty password field  
  if(pw == confirmpw) {  
     document.getElementById("passwordinvalidmessage").innerHTML = "";    			
     return true;  
  }
  document.getElementById("passwordinvalidmessage").innerHTML = "Both the passwords should be same!";  
  return false;
}  
function validateEmail() {
	var mail = document.getElementById("email").value;
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)){
		document.getElementById("emailinvalidmessage").innerHTML = "";  
		return true;
	}
    document.getElementById("emailinvalidmessage").innerHTML = "Enter a valid EmailID!";  
    return false;
}

</script>

</html>