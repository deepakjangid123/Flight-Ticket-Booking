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
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String email=request.getParameter("Email");
String passwd1= request.getParameter("PWD1");
String passwd2= request.getParameter("PWD2");
String contact=request.getParameter("Contact");
String DOB=request.getParameter("DOB");
String address=request.getParameter("Address");
String gender=request.getParameter("gender");
int creditcardno=Integer.parseInt(request.getParameter("credit_card_no"));
 
if(passwd1.equals(passwd2))
{


String tempemail;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select username from customer");
	
	  while(result.next()){
		   tempemail = result.getString("username");
			
		 
		    if(tempemail.equals(email))
			{
				flag=1;
				
				
			}
	
	  }
	  if(flag==1){
	  %>
       <jsp:forward page="homepage3.jsp"></jsp:forward>
    <%
	  }
	  if(flag==0)
	  {
		PreparedStatement stmt=connect.prepareStatement("INSERT INTO customer VALUES (?,?,?,?,?,?,?,?)");
		stmt.setString(1,email);
		stmt.setString(2,passwd1);
		stmt.setString(3,fname);
		stmt.setString(4,lname);
		stmt.setString(5,address);
		stmt.setString(6,gender);
		stmt.setString(7,contact);
		stmt.setInt(8,creditcardno);
		stmt.executeUpdate();
		%>
       <jsp:forward page="homepage4.jsp"></jsp:forward>
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
       <jsp:forward page="signup1.jsp"></jsp:forward>
    <%
 }
 %>

</body>
</html>