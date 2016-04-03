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
<title>verifybooking id</title>
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
<%
String email=session.getAttribute("userName").toString();
String enteredemail=request.getParameter("email");
String bookingid=request.getParameter("bookingid");
String flightid=bookingid.substring(0,6);
String check=bookingid.substring(16,17);
String flightclass="";
if(check.equals("b"))
	flightclass="business";
else if(check.equals("e"))
	flightclass="economy";

String tempbookingid;
int tempavailableseats=0;
String tempflightclass,tempflightid;
int flag2=1;
int number=0;
if(enteredemail.equals(email)){	
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	 ResultSet result1 = state.executeQuery("select * from ticket");
	 while(result1.next()){
		   tempbookingid = result1.getString("booking_id");
			
		    if(tempbookingid.equals(bookingid))
			{
				number++;
				
				flag2=0;
				PreparedStatement ins=connect.prepareStatement("delete from ticket where booking_id='"+bookingid+"'");
				ins.executeUpdate();
				
			}
	
	  }
	  ResultSet result2 = state.executeQuery("select * from seats");
	 while(result2.next()){
		   tempflightid = result2.getString("flight_id");
		   tempflightclass = result2.getString("flight_class");
			
		    if(tempflightid.equals(flightid) && tempflightclass.equals(flightclass))
			{
				
				tempavailableseats = result2.getInt("available_seats");
				tempavailableseats=tempavailableseats+number;
	
				
			}
	
	  }
		   
	  
	  if(flag2==1)
	  {
		%>
       <jsp:forward page="bookingidnotfound.jsp"></jsp:forward>
		<%
	  }
	  else if(flag2==0)
	  {
		PreparedStatement ins=connect.prepareStatement("update seats set available_seats=? where flight_id='"+flightid+"' and flight_class='"+flightclass+"'");
		ins.setInt(1,tempavailableseats);
		ins.executeUpdate();
		%>
       <jsp:forward page="ticketcancelled.jsp"></jsp:forward>
		<%
		}
	   connect.close();
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 }
 else
 {
	%>
       <jsp:forward page="cancelticket1.jsp"></jsp:forward>
		<%
 }

 %>

</body>
</html>