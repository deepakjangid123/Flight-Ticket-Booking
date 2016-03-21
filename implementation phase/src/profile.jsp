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
<title>Profile</title>
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

	
<%
String email=session.getAttribute("userName").toString();
String fname=session.getAttribute("firstname").toString();
String lname=session.getAttribute("lastname").toString();
String Address=session.getAttribute("ADDress").toString();
String passwd=session.getAttribute("passwrd").toString();
String gender=session.getAttribute("Gender").toString();
String contactno=session.getAttribute("contactno").toString();
try{ 

			%>
			<div class="col-md-10 col-md-offset-1">
				<h4 style="color:indigo"><i><b>Your Details:-</b></i></h4>
			</div>
			<div class="col-md-10 col-md-offset-1">
			 <table border="3" align="left" bordercolor="yellow" width="39%" cellspacing="2" cellpadding="4">
				<tr >
					<td style="color:cyan"><b>Name</b></td>
					<td style="color:brown"><b><%=fname%> <%=lname%></b></td>
				</tr>
				<tr>	
					<td style="color:cyan"><b>Email ID</b></td>
					<td style="color:brown"><b><%=email%></b></td>
				</tr>
				<tr>
					<td style="color:cyan"><b>Gender</b></td>
					<td style="color:brown"><b><%=gender%></b></td>
				</tr>
				<tr>
					<td style="color:cyan"><b>Address</b></td>
					<td style="color:brown"><b><%=Address%></b></td>
				</tr>
				<tr>
					<td style="color:cyan"><b>Contact No.</b></td>
					<td style="color:brown"><b><%=contactno%></b></td>
				</tr>

				</table>
				</div>
				<br>
				</br>
				<div class="col-md-12 col-md-offset-1">
				<br>
				</br>
					<form action="changepassword.jsp" method="post">
						<button type="submit" class="btn btn-default center">Change Password</button>
					</form>
				</div>
			<%
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 
 %>
</body>
</html>
