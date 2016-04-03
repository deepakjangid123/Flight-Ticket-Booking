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
<title>PAY!</title>
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

String email=session.getAttribute("userName").toString();
String flightid=session.getAttribute("flightid").toString();
String flightclass=session.getAttribute("flightclass").toString();
String departuredate=session.getAttribute("departuredate").toString();


if(nooftickets==1)
{
	String passenger1=request.getParameter("passenger1");
	//out.println(passenger1);
	session.setAttribute("passenger1",passenger1);
}
else if(nooftickets==2)
{
	String passenger1=request.getParameter("passenger1");
	String passenger2=request.getParameter("passenger2");
	session.setAttribute("passenger1",passenger1);
	session.setAttribute("passenger2",passenger2);
}
else if(nooftickets==3)
{
	String passenger1=request.getParameter("passenger1");
	String passenger2=request.getParameter("passenger2");
	String passenger3=request.getParameter("passenger3");
	session.setAttribute("passenger1",passenger1);
	session.setAttribute("passenger2",passenger2);
	session.setAttribute("passenger3",passenger3);
}
else if(nooftickets==4)
{
	String passenger1=request.getParameter("passenger1");
	String passenger2=request.getParameter("passenger2");
	String passenger3=request.getParameter("passenger3");
	String passenger4=request.getParameter("passenger4");
	session.setAttribute("passenger1",passenger1);
	session.setAttribute("passenger2",passenger2);
	session.setAttribute("passenger3",passenger3);
	session.setAttribute("passenger4",passenger4);
}
else if(nooftickets==5)
{
	String passenger1=request.getParameter("passenger1");
	String passenger2=request.getParameter("passenger2");
	String passenger3=request.getParameter("passenger3");
	String passenger4=request.getParameter("passenger4");
	String passenger5=request.getParameter("passenger5");
	session.setAttribute("passenger1",passenger1);
	session.setAttribute("passenger2",passenger2);
	session.setAttribute("passenger3",passenger3);
	session.setAttribute("passenger4",passenger4);
	session.setAttribute("passenger5",passenger5);
}
		%>
			<form action="verifycreditcardno.jsp">
				<div class="row">

			<div class="form-group">
				<label for="creditcardno"><b Style="color:lime">Enter Credit Card No.</b></label>
					<input type="number" max="99999999" min="11111111" name="creditcardno" class="form-control" id="icreditcardno" placeholder="8-digit Credit Card Number" required>
				</div>
				<button type="submit" class="btn btn-default">PAY</button>
			
			</div>
			</form>
		<%
		
		
	  
	  

 %>

</div>
</body>
</html>
