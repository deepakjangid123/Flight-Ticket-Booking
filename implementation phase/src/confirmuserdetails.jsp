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
<title>Confirm User Details</title>
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
String flightid=session.getAttribute("flightid").toString();
String flightclass=session.getAttribute("flightclass").toString();
int nooftickets1=Integer.parseInt(request.getParameter("nooftickets"));
String noofticketss=request.getParameter("nooftickets");
session.setAttribute("nooftickets",noofticketss);




String tempflightid,tempflightclass;
int tempavailableseats;
int flag2=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	 ResultSet result1 = state.executeQuery("select * from seats");
	 while(result1.next()){
		   tempflightid = result1.getString("flight_id");
			tempflightclass=result1.getString("flight_class");
		    if(tempflightid.equals(flightid) && tempflightclass.equals(flightclass))
			{
				tempavailableseats=result1.getInt("available_seats");
				if(tempavailableseats>=nooftickets1)
					flag2=1;
			}
	
			
	
	  }
	  if(flag2==0)
	  {
		%>
       <jsp:forward page="notenoughseats.jsp"></jsp:forward>
		<%
	  }
	  else if(flag2==1)
	  {
		%>
       <jsp:forward page="passengerdetails.jsp"></jsp:forward>
		<%
		}
	   connect.close();
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 

 %>

</body>
</html>