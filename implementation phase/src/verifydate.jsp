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
<title>Sign up</title>
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
String Source=request.getParameter("source");
session.setAttribute("source",Source);
String flightclass=request.getParameter("flightclass");
session.setAttribute("flightclass",flightclass);
String Destination=request.getParameter("destination");
session.setAttribute("destination",Destination);
String Departure_date=request.getParameter("departuredate");
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   //get current date time with Date()
	   Date date = new Date();
	DateFormat dat = new SimpleDateFormat("yyyy-MM-dd");
String dt= dat.format(date);
out.println(dt);
out.println(Departure_date);
SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
Date depart = formatter.parse(Departure_date);
Date current = formatter.parse(dt);
long millisDiff = current.getTime() - depart.getTime();
double daysDiff = (double)millisDiff/(1000*60*60*24);
DateFormat dformat=new SimpleDateFormat("EEEE"); 
 String Day=dformat.format(dat.parse(Departure_date));
 session.setAttribute("day",Day);
if(daysDiff<=0)
{


String tempsource,tempdestination,tempday;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select * from flight_info");
	
	  while(result.next()){
		   tempsource = result.getString("source");
		   tempdestination = result.getString("destination");
			tempday=result.getString("departure_day");
		 
		    if(tempsource.equals(Source) && tempdestination.equals(Destination) && tempday.equals(Day))
			{
				flag=1;
			}
	
	  }
	  if(flag==0)
	  {
		%>
       <jsp:forward page="noflights.jsp"></jsp:forward>
		<%
	  }
	  else if(flag==1)
	  {
		%>
       <jsp:forward page="flightdetails.jsp"></jsp:forward>
		<%
	  }
	 
	   connect.close();
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
  }
 }
 else if(daysDiff>0)
 {
 %>
       <jsp:forward page="homepage2a.jsp"></jsp:forward>
    <%
 }
 %>

</body>
</html>