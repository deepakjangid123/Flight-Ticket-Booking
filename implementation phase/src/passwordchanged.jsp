<!DOCTYPE html>
<html>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<!-- Optional theme -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="./bootstrap/js/bootstrap.min.js"></script>
<title>Password has been changed</title>
<head>
	<a align="center" href="homepage.htm" target="link" style="color:lime"><h1>GreenTrip.com</h1></a>
	<style>
	.part {
		-webkit-column-count: 4; 
		-webkit-column-gap: 10px;
		-moz-column-count: 4;
	}
	</style>
</head>
<body background="images\hp_bg.jpg">


<div class="row">
	<div class="col-md-9 col-md-offset-10">
		Hello, <a href="profile.jsp"><b style="color:lime"><%= session.getAttribute( "firstname" )%> <%=session.getAttribute("lastname")%></b></a>
	</div>

</div>
<div class="row">
	<div class="col-md-9 col-md-offset-11">
		<form action="homepage.htm">
			<button type="submit"><u>Logout</u></button>
		</form>
	
	</div>

</div>
<div class="row">	
	<nav class="nav">
		<div class="col-sm-1"><a align="center" href="homepage.htm" style="color:lime"><h4>Flight</h4></a></div>
		<div class="col-sm-1"><a align="center" href="homepage.htm" style="color:lime"><h4>Complaint</h4></a></div>
		<div class="col-sm-1"><a align="center" href="homepage.htm" style="color:lime"><h4>Instructions</h4></a></div>
		<div class="col-sm-2"><a align="center" href="homepage.htm" style="color:lime"><h4>Contact Us</h4></a></div>
		<div class="col-sm-3"></div>
	</nav>
	<div class="col-md-5 col-md-offset-1">
		<h3 style="color:white"><b>Book your flight ticket here!</b></h3>
	</div>
</div>
<div class="row">
	<div class="col-md-5 col-md-offset-1">
		<i style="color:indigo"><b>Your password has been changed!</b></i>
	</div>
	</div>
	<div>
	<div class="col-md-5 col-md-offset-1">
	<form action="homepage2.jsp">
		
			<button type="submit" class="btn btn-default">Go back</button>
		</form>
	</div>
	</div>
	



</body>
</html>
