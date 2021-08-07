<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Socrates | Register</title>
</style>
</head>
<body>
	<h1>Register to Socrates</h1>
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
	</form>
	
</body>
<script>
function validateForm() {
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