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
<title>Verification</title>
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
String pwd=session.getAttribute("passwrd").toString();
String oldpwd=request.getParameter("oldPWD");
String newpwd= request.getParameter("newPWD1");
String tempemail,tempoldpwd;
int flag=0;

if(pwd.equals(oldpwd)){
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select * from customer");
	
	  while(result.next()){
		   tempemail=result.getString("username");
		   tempoldpwd=result.getString("password");
		    if(email.equals(tempemail) && oldpwd.equals(tempoldpwd))
			{
				 PreparedStatement insert= connect.prepareStatement("UPDATE customer SET password = ? WHERE username = ?");
				 insert.setString(1,newpwd);
				 insert.setString(2,email);
				 session.setAttribute("passwrd",newpwd);
				  insert.executeUpdate();
				  %>
       <jsp:forward page="passwordchanged.jsp"></jsp:forward>
    <%
			}
	
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
       <jsp:forward page="changepassword1.jsp"></jsp:forward>
    <%
	  
	  }
	
	
 %>

</body>
</html>