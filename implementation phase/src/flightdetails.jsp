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
<title>Flight Details</title>
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
<div>
<%
String Source=session.getAttribute("source").toString();
String Destination=session.getAttribute("destination").toString();
String flightclass=session.getAttribute("flightclass").toString();
String Day=session.getAttribute("day").toString();

String tempflightid,tempflightclass;
String tempsource,tempdestination,tempday;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	ResultSet result = state.executeQuery("select * from flight_info");
		
		
			 %>
			 <table border="2" bordercolor="yellow" width="100%" cellspacing="2" cellpadding="3">
				<tr style="color:cyan">
					<td><b>Flight ID</b></td>
					<td><b>Source</b></td>
					<td><b>Destination</b></td>
					<td><b>Departure Time</b></td>
					<td><b>Arrival Time</b></td>
					<td><b>Arrival Day</b></td>
					<td><b>Class</b></td>
					<td><b>Available Seats</b></td>
					<td><b>Amount(per ticket)</b></td>
					<td><b>Book Now!</b></td>
					
				</tr>
			 
			 <%while(result.next()){
		   tempsource = result.getString("source");
		   tempdestination = result.getString("destination");
			tempday=result.getString("departure_day");
		 
		    if(Source.equals(tempsource) && Destination.equals(tempdestination) && Day.equals(tempday))
			{
			
				
				String flightid=result.getString("flight_id");

				String departuretime= result.getString("departure_time");
				String arrivaltime= result.getString("arrival_time");
				String arrivalday= result.getString("arrival_day");
				int totalseats= result.getInt("total_seats");
				session.setAttribute("flightid",flightid);
				session.setAttribute("totalseats",totalseats);
				session.setAttribute("departuretime",departuretime);
				session.setAttribute("arrivaltime",arrivaltime);
				session.setAttribute("arrivalday",arrivalday);
				ResultSet result1 = state.executeQuery("select * from seats ");
				while(result1.next()){
					tempflightid = result1.getString("flight_id");
					tempflightclass = result1.getString("flight_class");
					if(flightid.equals(tempflightid) && flightclass.equals(tempflightclass)){
					int availableseats=result1.getInt("available_seats");
				int amount=result1.getInt("amount");
				session.setAttribute("availableseats",availableseats);
				session.setAttribute("amount",amount);
				%>
					<tr style="color:brown">
						<td><b><%=flightid%></b></td>
						<td><b><%=Source%></b></td>
						<td><b><%=Destination%></b></td>
						<td><b><%=departuretime%></b></td>
						<td><b><%=arrivaltime%></b></td>
						<td><b><%=arrivalday%></b></td>
						<td><b><%=flightclass%></b></td>
						<td><b><%=availableseats%></b></td>
						<td><b><%=amount%></b></td>
						<td><form action="enterdetails.jsp" align="center">
							<button type="submit"><i><u>Book!</u></i></button>
							</form></td>
					</tr>
				
				<%
				
				
				}
				}
				
			}
	
	  }
	%>
	</table>
	<%
	 
	 
	   connect.close();
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 
 
 %>
</div>
</body>
</html>