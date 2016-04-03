<!DOCTYPE html>
<html>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<!-- Optional theme -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="./bootstrap/js/bootstrap.min.js"></script>
<script src="./jquery/jquery.min.js"></script>
<title>Change Password</title>
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

<script>

check = function() {

if($("#inewPWD1").val() == $("#inewPWD2").val())
	return true;
else{
	alert("Changed passwords are not matching");
	return false;
	
} 
	
}
</script>

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
		<div class="col-sm-1"><a align="center" href="homepage2.jsp" style="color:lime"><h4>Flight</h4></a></div>
		<div class="col-sm-1"><a align="center" href="homepage.htm" style="color:lime"><h4>Complaint</h4></a></div>
		<div class="col-sm-1"><a align="center" href="homepage.htm" style="color:lime"><h4>Instructions</h4></a></div>
		<div class="col-sm-2"><a align="center" href="homepage.htm" style="color:lime"><h4>Contact Us</h4></a></div>
		<div class="col-sm-3"></div>
	</nav>
	<div class="col-md-5 col-md-offset-1">
		<h3 style="color:white"><b>Book your flight ticket here!</b></h3>
	</div>
	<div class="container col-md-3 col-md-offset-2">
		<div class="row">
			<form onsubmit="return check()" action="passwordchangeverify.jsp" method="post">
				<div>
					<i style="color:red"><b>Entered Password is wrong!</b></i>
				</div>
				<div class="form-group">
						<label for="oldPWD">Old Password : </label>
						<input type="password" name="oldPWD" class="form-control" id="ioldPWD1" placeholder="old password" required>
				</div>
				<div class="form-group ">
					<label for="newPWD1">New Password : </label>
					<input type="password" name="newPWD1" class="form-control" id="inewPWD1" placeholder="new password" required>
				</div>
				<div class="form-group ">
					<label for="newPWD2">Confirm New Password : </label>
					<input type="password" name="newPWD2" class="form-control" id="inewPWD2" placeholder="confirm new password" required>
					
				</div>
				<button type="submit" onclick="check()" class="btn btn-default center">Change password</button>
			</form>
		</div>
	</div>
</div>



</body>
</html>
