<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>SOCRATES WELCOME</title>
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
<style>
.logout {
	text-align:right;
	height: 30px;
	right: 40px;
	position: fixed;
  
}

</style>
</head>
<body onload = "toggle_div();">
	<div class="limiter">
		
			<!-- Logout button -->
		<div class="wrap-login98">
			<ul>
				<li class="nav-item">
					<a class="nav-link logout" id="logout-tab" href="index.jsp" aria-selected="false">Logout</a>
				</li>
			</ul>
			
			<!-- Tab List -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="about-tab" data-toggle="tab" href="#about" role="tab" aria-controls="About" aria-selected="false">About</a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content p-t-20 p-l-20">
				<div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
					Welcome <%= request.getAttribute("name")%><br/>
					Username : <%= request.getParameter("username")%><br/>
					Email ID : <%=request.getAttribute("email")%><br/>
				</div>
				<div class="tab-pane" id="about" role="tabpanel" aria-labelledby="about-tab">
					SOCRATES (Society for Rapid Assimilation of Technology in Systems) is the face of technology at XLRI. 
					Team SOCRATES is a dedicated group of individuals who are passionate about technology and its business applications.
				</div>
			</div>
		</div>
	</div>
	
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
<script type="text/javascript" id="demoscript">
	$('#myTab a').on('click', function (e) {
		e.preventDefault()
		$(this).tab('show')
	})
</script>
</html>