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
<title>verification</title>
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

int creditcardno=Integer.parseInt(request.getParameter("creditcardno"));
String c= Integer.toString(creditcardno);

String tempemail;
int tempcreditcardno;
int flag2=1;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=feelthechange");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	 ResultSet result1 = state.executeQuery("select * from customer");
	 while(result1.next()){
		   tempemail = result1.getString("username");
			
		    if(tempemail.equals(email))
			{
			
				tempcreditcardno=result1.getInt("credit_card_no");
				String d=Integer.toString(tempcreditcardno);
				if(d.equals(c))
					flag2=0;
			}
	
			
	
	  }
	  if(flag2==1)
	  {
		%>
       <jsp:forward page="invalidcreditcardno.jsp"></jsp:forward>
		<%
	  }
	  else if(flag2==0)
	  {
		%>
       <jsp:forward page="ticketconfirmation1.jsp"></jsp:forward>
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