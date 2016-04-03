<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<html>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<!-- Optional theme -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="./bootstrap/js/bootstrap.min.js"></script>
<title>Ticket details!</title>
<body background="images\hp_bg.jpg">
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

<div class="row">
<%
String bookingid=session.getAttribute("bookingid").toString();

String tempbookingid="";
String name="";
String username="";
String flightid="";
double amount=0;
try{
  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	%><div class="row">
		<div class="col-md-5 col-md-offset-1">
				<h4 style="color:indigo"><i><b>Your Ticket Details:-</b></i></h4>
			
			
			<div class="col-md-5 col-md-offset-1">
			 <table border="3" align="center" bordercolor="yellow" width="100%" cellspacing="2" cellpadding="9">
			 <tr >
					<td style="color:cyan"><b>Name</b></td>
					<td style="color:cyan"><b>Booking ID</b></td>
					<td style="color:cyan"><b>Booking Email ID</b></td>
					<td style="color:cyan"><b>Flight ID</b></td>
					<td style="color:cyan"><b>Amount</b></td>
				</tr>
	<%
	 ResultSet result = state.executeQuery("select * from ticket");
	 while(result.next())
	 {
		tempbookingid=result.getString("booking_id");
		if(tempbookingid.equals(bookingid))
			{
				
				name=result.getString("name");
				username=result.getString("username");
				flightid=result.getString("flight_id");
				amount=result.getDouble("amount");
				%>
				<tr>
					<td style="color:cyan"><b><%=name%></b></td>
					<td style="color:cyan"><b><%=bookingid%></b></td>
					<td style="color:cyan"><b><%=username%></b></td>
					<td style="color:cyan"><b><%=flightid%></b></td>
					<td style="color:cyan"><b><%=amount%></b></td>
				</tr>
				<%
			}
			
	 }
	 %>
			</table>
				
				
				
				<br>
				</br>
				<div class="col-md-15 col-md-offset-5">
				<br>
				</br>
					<form action="homepage2.jsp" method="post">
						<button type="submit" class="btn btn-default center">Take Me Home!</button>
					</form>
					<form action="cancelticket.jsp" method="post">
						<button type="submit" class="btn btn-default center">Cancel Ticket(s)</button>
					</form>
				</div>
				</div>
	 <%
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 
 %>
 </div>
</body>
</html>
