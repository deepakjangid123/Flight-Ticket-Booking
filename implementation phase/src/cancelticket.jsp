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
<title>Cancel Ticket</title>
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
var username = <%=session.getAttribute("userName")%>;
if($("#iemail").val() == $("#username").val())
	return true;
else{
	alert("You can't cancel others ticket, Sir!");
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
</div>
<div class="col-md-5 col-md-offset-1">


			<form onsubmit="return check()" action="verifybookingid.jsp" method="post">
				<div class="row">

			<div class="form-group">
				<label for="emailid"><b Style="color:lime">Enter Your Email ID</b></label>
					<input type="email" name="email" class="form-control" id="iemail" placeholder="Email" required>
				</div>
				<div class="form-group">
				<label for="bookingid"><b Style="color:lime">Enter Booking ID</b></label>
					<input type="text" name="bookingid" class="form-control" id="ibookingid" placeholder="Booking ID" required>
				</div>
				
				<button type="submit" onclick="check()" class="btn btn-default">Cancel Ticket</button>
			
			</div>
			</form>
		


</div>
</body>
</html>
