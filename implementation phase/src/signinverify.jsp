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
<title>Sign in</title>
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
String email=request.getParameter("Email");
String passwd= request.getParameter("PWD");

String tempemail,temppasswd,tempfname,templname;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select username,password,first_name,last_name from customer");
	
	  while(result.next()){
		   tempemail = result.getString("username");
			temppasswd=result.getString("password");
			tempfname=result.getString("first_name");
			templname=result.getString("last_name");
		 
		    if(tempemail.equals(email) && temppasswd.equals(passwd))
			{
				flag=1;
				String fname=tempfname;
				String lname=templname;
				session.setAttribute("userName",email);
				session.setAttribute("firstname",fname);
				session.setAttribute("lastname",lname);
				
			}
	
	  }
	  if(flag==1){
	  %>
       <jsp:forward page="homepage2.jsp"></jsp:forward>
    <%
	  }
	  if(flag==0)
	  {
		%>
       <jsp:forward page="homepage1.htm"></jsp:forward>
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