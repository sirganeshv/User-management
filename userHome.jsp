<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>SOCRATES WELCOME</title>
<style>
.logout {
	text-align:right;
	height: 30px;
	right: 40px;
	position: fixed;
  
}
.list-reset {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex !important;
	box-sizing : border-box;
}

.top-bar {
	position: fixed;
	min-width: auto;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 5050;
	height: 50px;
}

.hide {
	display:none;
}

.list-item{
	margin-right: 5px;
}

</style>
</style>
</head>
<body onload = "toggle_div();">
	<header class="top-bar">
	<div class = "logout">
	<input type="button" Value="Logout" onclick="location.href = 'index.jsp';">
	</div>
	<ol class="list-reset" name="tabs"> 
		<li class="list-item is-selected"> <a href="#/home" active>Home</a></li>
		<li class="list-item"> <a href="#/about">About</a></li>

	</ol>
	</header><br/><br/>
	<div name="content" id="content">
		<div name="home" id="home"  class="hide">
			Welcome <%= request.getAttribute("name")%><br/>
			Username : <%= request.getParameter("username")%><br/>
			Email ID : <%=request.getAttribute("email")%><br/>
		</div>

		<div name="about" id="about"  class="hide">
			<h1>Know about SOCRATES</h1>
			<div class="about-content">
				SOCRATES (Society for Rapid Assimilation of Technology in Systems) is the face of technology at XLRI. 
				Team SOCRATES is a dedicated group of individuals who are passionate about technology and its business applications.
			</div>
		</div>

	</div>
	
	

	
</body>
<script type="text/javascript" id="demoscript">
window.addEventListener('hashchange', function(){
	toggle_div();
})
	function toggle_div() {
		hash = (window.location.hash.slice(2));
		var ancestor = document.getElementById('content');
		descendents = ancestor.children;
		for (i = 0; i < descendents.length; ++i) {
			e = descendents[i];
			e.style.display = "none";
			if (!hash || hash.length === 0 ) {
				document.getElementById('home').style.display="block";
			}
			else if (e.id == hash) {
				e.style.display ="block";
			}
		}
		
	}
    </script>
</html>