<%@ taglib uri="http://www.tagunit.org/tagunit/core" prefix="tagunit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>

<tagunit:assertEquals name="PASSWORD VERIFY: Testing">
  <tagunit:actualResult>
    <c:set var="p1" value="yongchak"/>
    <c:set var="p2" value="yongchak"/>
    <c:choose>
        <c:when test="${ p1==p2}">
         Password matched!!
        </c:when>
        <c:otherwise>
          Password doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
    Password matched!!
  </tagunit:expectedResult>
</tagunit:assertEquals>

<%
String email="syedahamad10@gmail.com";
String pwd="yongchak";

String oldpwd=request.getParameter("oldPWD");
String newpwd= request.getParameter("newPWD1");
String tempemail,tempoldpwd;
int flag=0;

try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=yongchak");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select * from customer where username='"+email+"'");
	
	  if(result.next()){
		   tempemail=result.getString("username");
		   tempoldpwd=result.getString("password");
		    if(email.equals(tempemail) && oldpwd.equals(tempoldpwd))
			{
				 PreparedStatement insert= connect.prepareStatement("UPDATE customer SET password = ? WHERE username = ?");
				 insert.setString(1,newpwd);
				 insert.setString(2,email);
				 session.setAttribute("passwrd",newpwd);
				  insert.executeUpdate();
				  
				  pageContext.setAttribute("mail1", tempemail);
				  pageContext.setAttribute("pwd1", newpwd);
			}
	
	  }
	  pageContext.setAttribute("mail", email);
	  pageContext.setAttribute("pwd", pwd);
	  %>
	  			  
<tagunit:assertEquals name="SIGN IN: Email matching">
  <tagunit:actualResult>
    <c:choose>
        <c:when test="${ mail==mail1}">
		<c:out value="${mail}"/>
         Credential matched!!
        </c:when>
        <c:otherwise>
         Credential doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
    syedahamad10@gmail.comCredential matched!!
  </tagunit:expectedResult>
</tagunit:assertEquals>
<% 
	   connect.close();
	   }catch(Exception ex){
	  //handle error
	  ex.printStackTrace();
	  }
	
 %>
