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
<title>Passenger Details!</title>
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
<%

String noofticketss=session.getAttribute("nooftickets").toString();
int nooftickets=Integer.parseInt(noofticketss);
//out.println(nooftickets);

String tempemail,tempdestination,tempday,tempflightid,tempflightclass;

int flag2=0;
int i=0;

	if(nooftickets==1)
	{
		%>
			<form action="Pay.jsp">
				<div class="row">
				<div class="form-group">
				<label for="passenger1"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger1" class="form-control" id="ipassenger1" placeholder="Enter Name" required>
				</div>
				<button type="submit" class="btn btn-default">Go To Payment</button>
				</div>
			<form>
		<%
	}
	else if(nooftickets==2)
	{
		%>
		<form action="Pay.jsp">
				<div class="row">
				<div class="form-group">
				<label for="passenger1"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger1" class="form-control" id="ipassenger1" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger2"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger2" class="form-control" id="ipassenger2" placeholder="Enter Name" required>
				</div>
				<button type="submit" class="btn btn-default">Go To Payment</button>
				</div>
			<form>
			<%
	}
	else if(nooftickets==3)
	{
	%>
		<form action="Pay.jsp">
				<div class="row">
				<div class="form-group">
				<label for="passenger1"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger1" class="form-control" id="ipassenger1" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger2"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger2" class="form-control" id="ipassenger2" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger3"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger3" class="form-control" id="ipassenger3" placeholder="Enter Name" required>
				</div>
				<button type="submit" class="btn btn-default">Go To Payment</button>
				</div>
			<form>
			<%
	}
	else if(nooftickets==4)
	{
	%>
		<form action="Pay.jsp">
				<div class="row">
				<div class="form-group">
				<label for="passenger1"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger1" class="form-control" id="ipassenger1" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger2"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger2" class="form-control" id="ipassenger2" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger3"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger3" class="form-control" id="ipassenger3" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger4"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger4" class="form-control" id="ipassenger4" placeholder="Enter Name" required>
				</div>
				<button type="submit" class="btn btn-default">Go To Payment</button>
				</div>
			<form>
			<%
	}
	else if(nooftickets==5)
	{
	%>
		<form action="Pay.jsp">
				<div class="row">
				<div class="form-group">
				<label for="passenger1"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger1" class="form-control" id="ipassenger1" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger2"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger2" class="form-control" id="ipassenger2" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger3"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger3" class="form-control" id="ipassenger3" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger4"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger4" class="form-control" id="ipassenger4" placeholder="Enter Name" required>
				</div>
				<div class="form-group">
				<label for="passenger5"><b Style="color:lime">Passenger Name</b></label>
					<input type="text" name="passenger5" class="form-control" id="ipassenger5" placeholder="Enter Name" required>
				</div>
				<button type="submit" class="btn btn-default">Go To Payment</button>
				</div>
			<form>
			<%
	}
	
		
	  
	  
	  

 %>

</div>
</body>
</html>
