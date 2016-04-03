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
<title>Booking Details</title>
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

	
<%

String email=session.getAttribute("userName").toString();
String tempemail,tempamount,tempbookingid,tempdate,tempflightid,tempname;
int flag=0;
int flag2=0;
try{ 

		Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	 
	 ResultSet result = state.executeQuery("select * from ticket");
	%>
	<div class="col-md-10 col-md-offset-1">
				<h4 style="color:indigo"><i><b>Your Booking Details:-</b></i></h4>
			</div>
	<div class="col-md-5 col-md-offset-1">
			 <table border="3" align="center" bordercolor="yellow" width="100%" cellspacing="2" cellpadding="9">
			 <tr >
					<td style="color:cyan"><b>Name</b></td>
					<td style="color:cyan"><b>Booking ID</b></td>
					<td style="color:cyan"><b>Booking Email ID</b></td>
					<td style="color:cyan"><b>Flight ID</b></td>
					<td style="color:cyan"><b>Amount</b></td>
					<td style="color:cyan"><b>Departure Date</b></td>
			</tr>
			
		<%
	  while(result.next()){
		   tempemail=result.getString("username");
		   
		    if(tempemail.equals(email))
			{	
				flag=1;
				tempbookingid=result.getString("booking_id");
				tempname=result.getString("name");
				tempflightid=result.getString("flight_id");
				tempamount=result.getString("amount");
				tempdate=tempbookingid.substring(6,16);
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			   //get current date time with Date()
			   Date date = new Date();
			DateFormat dat = new SimpleDateFormat("yyyy-MM-dd");
					String dt= dat.format(date);
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
			Date tdate = formatter.parse(tempdate);
			Date current = formatter.parse(dt);
			long millisDiff = current.getTime() - tdate.getTime();
			double daysDiff = (double)millisDiff/(1000*60*60*24);
			DateFormat dformat=new SimpleDateFormat("EEEE"); 
			 String Day=dformat.format(dat.parse(tempdate));
			if(daysDiff<=0)
			{
			flag2=1;
			%>
			
			
				<tr>
					<td style="color:cyan"><b><%=tempname%></b></td>
					<td style="color:cyan"><b><%=tempbookingid%></b></td>
					<td style="color:cyan"><b><%=email%></b></td>
					<td style="color:cyan"><b><%=tempflightid%></b></td>
					<td style="color:cyan"><b><%=tempamount%></b></td>
					<td style="color:cyan"><b><%=tempdate%></b></td>
				</tr>

				
				<%
			}
		}
	   }
	   if(flag==0)
	   {
			%>
					<h5 style="color:red">No Bookings are there for the current email_id!! </h5>
			<%
	   }
	   else if(flag==1 && flag2==0)
	   {
	   
				%>
					<h5 style="color:red">No Bookings are there today or in the future!! </h5>
				<%
	   }
	   %>
				</table>
					</div>
				<br>
				</br>
				<div class="col-md-12 col-md-offset-1">
				<br>
				</br>
					<form action="cancelticket.jsp" method="post">
						<button type="submit" class="btn btn-default center">Cancel Booking</button>
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
