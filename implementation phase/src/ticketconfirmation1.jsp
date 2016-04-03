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
<title>Ticket(s) has been confirmed!</title>
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
		<h4 style="color:indigo"><b>Payment Successful! And ticket(s) has been booked!!</b></h4>
	</div>
	<br>
<div class ="row">
<%
String passenger1="";
String passenger2="";
String passenger3="";
String passenger4="";
String passenger5="";

String email=session.getAttribute("userName").toString();
String flightid=session.getAttribute("flightid").toString();
String flightclass=session.getAttribute("flightclass").toString();
String noofticketss=session.getAttribute("nooftickets").toString();
int nooftickets=Integer.parseInt(noofticketss);
String departuredate=session.getAttribute("departuredate").toString();
String tempflightid="",tempflightid1="",tempflightclass="";
int temptotalseats=0,tempavailableseats=0;
double total_amount=0;
double nettamount=0;

if(nooftickets==1)
{
	passenger1=session.getAttribute("passenger1").toString();
}
else if(nooftickets==2)
{
	passenger1=session.getAttribute("passenger1").toString();
	passenger2=session.getAttribute("passenger2").toString();
}
else if(nooftickets==3)
{
	passenger1=session.getAttribute("passenger1").toString();
	passenger2=session.getAttribute("passenger2").toString();
	passenger3=session.getAttribute("passenger3").toString();
}
else if(nooftickets==4)
{
	passenger1=session.getAttribute("passenger1").toString();
	passenger2=session.getAttribute("passenger2").toString();
	passenger3=session.getAttribute("passenger3").toString();
	passenger4=session.getAttribute("passenger4").toString();
}
else if(nooftickets==5)
{
	passenger1=session.getAttribute("passenger1").toString();
	passenger2=session.getAttribute("passenger2").toString();
	passenger3=session.getAttribute("passenger3").toString();
	passenger4=session.getAttribute("passenger4").toString();
	passenger5=session.getAttribute("passenger5").toString();
}
	

try{
  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	 ResultSet result1 = state.executeQuery("select * from seats");
	 while(result1.next())
	 {
		tempflightid1=result1.getString("flight_id");
		tempflightclass=result1.getString("flight_class");
		if(tempflightid1.equals(flightid) && tempflightclass.equals(flightclass))
			{
				
				
				tempavailableseats=result1.getInt("available_seats");
				
				tempavailableseats=tempavailableseats-nooftickets;
			
				total_amount=result1.getDouble("amount");
				nettamount=nooftickets*total_amount;
			}
			
	 }
	 %>
		<div class="row">
		<h5 align="center" style="color:red"><br><br>Total amount = <%=nettamount%> has been paid!</h5>
		</div>
	 <%
	 
 
	String bookingid=flightid+departuredate+flightclass+"yo"+tempavailableseats;
		session.setAttribute("bookingid",bookingid);
		PreparedStatement ins1=connect.prepareStatement("update seats set available_seats=? where flight_id='"+flightid+"' and flight_class='"+flightclass+"'");
		ins1.setInt(1,tempavailableseats);
		ins1.executeUpdate();
	if(nooftickets==1){
		PreparedStatement ins2=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins2.setString(1,passenger1);
		ins2.setString(2,email);
		ins2.setString(3,bookingid);
		ins2.setString(4,flightid);
		ins2.setDouble(5,total_amount);
		ins2.executeUpdate();
		}
		else if(nooftickets==2){
		PreparedStatement ins3=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins3.setString(1,passenger1);
		ins3.setString(2,email);
		ins3.setString(3,bookingid);
		ins3.setString(4,flightid);
		ins3.setDouble(5,total_amount);
		ins3.executeUpdate();
		PreparedStatement ins4=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins4.setString(1,passenger2);
		ins4.setString(2,email);
		ins4.setString(3,bookingid);
		ins4.setString(4,flightid);
		ins4.setDouble(5,total_amount);
		ins4.executeUpdate();
		}
		else if(nooftickets==3){
		PreparedStatement ins5=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins5.setString(1,passenger1);
		ins5.setString(2,email);
		ins5.setString(3,bookingid);
		ins5.setString(4,flightid);
		ins5.setDouble(5,total_amount);
		ins5.executeUpdate();
		PreparedStatement ins6=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins6.setString(1,passenger2);
		ins6.setString(2,email);
		ins6.setString(3,bookingid);
		ins6.setString(4,flightid);
		ins6.setDouble(5,total_amount);
		ins6.executeUpdate();
		PreparedStatement ins7=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins7.setString(1,passenger3);
		ins7.setString(2,email);
		ins7.setString(3,bookingid);
		ins7.setString(4,flightid);
		ins7.setDouble(5,total_amount);
		ins7.executeUpdate();
		}
		else if(nooftickets==4){
		PreparedStatement ins11=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins11.setString(1,passenger1);
		ins11.setString(2,email);
		ins11.setString(3,bookingid);
		ins11.setString(4,flightid);
		ins11.setDouble(5,total_amount);
		ins11.executeUpdate();
		PreparedStatement ins8=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins8.setString(1,passenger2);
		ins8.setString(2,email);
		ins8.setString(3,bookingid);
		ins8.setString(4,flightid);
		ins8.setDouble(5,total_amount);
		ins8.executeUpdate();
		PreparedStatement ins9=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins9.setString(1,passenger3);
		ins9.setString(2,email);
		ins9.setString(3,bookingid);
		ins9.setString(4,flightid);
		ins9.setDouble(5,total_amount);
		ins9.executeUpdate();
		PreparedStatement ins0=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		ins0.setString(1,passenger4);
		ins0.setString(2,email);
		ins0.setString(3,bookingid);
		ins0.setString(4,flightid);
		ins0.setDouble(5,total_amount);
		ins0.executeUpdate();
		}
		else if(nooftickets==5){
		PreparedStatement insa=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		insa.setString(1,passenger1);
		insa.setString(2,email);
		insa.setString(3,bookingid);
		insa.setString(4,flightid);
		insa.setDouble(5,total_amount);
		insa.executeUpdate();
		PreparedStatement inss=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		inss.setString(1,passenger2);
		inss.setString(2,email);
		inss.setString(3,bookingid);
		inss.setString(4,flightid);
		inss.setDouble(5,total_amount);
		inss.executeUpdate();
		PreparedStatement insd=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		insd.setString(1,passenger3);
		insd.setString(2,email);
		insd.setString(3,bookingid);
		insd.setString(4,flightid);
		insd.setDouble(5,total_amount);
		insd.executeUpdate();
		PreparedStatement insz=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		insz.setString(1,passenger4);
		insz.setString(2,email);
		insz.setString(3,bookingid);
		insz.setString(4,flightid);
		insz.setDouble(5,total_amount);
		insz.executeUpdate();
		PreparedStatement insx=connect.prepareStatement("insert into ticket values(?,?,?,?,?)");
		insx.setString(1,passenger5);
		insx.setString(2,email);
		insx.setString(3,bookingid);
		insx.setString(4,flightid);
		insx.setDouble(5,total_amount);
		insx.executeUpdate();
		}
		
		
	   connect.close();
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 
 %>

</div>
<div class="col-md-5 col-md-offset-1">
	<div>
	<form action="homepage2.jsp">
				<div class="column">
				<button type="submit" class="btn btn-default">OKAY! Take ME HOME</button>
			</div>
			</form>
		</div>
	<div>
	<form action="recentlybookedticketdetails.jsp">
				<div class="column">
				<button type="submit" class="btn btn-default">See The Details</button>
			</div>
			</form>
		</div>	
</div>
</body>
</html>
