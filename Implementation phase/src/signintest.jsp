<%@ taglib uri="http://www.tagunit.org/tagunit/core" prefix="tagunit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>




<tagunit:assertEquals name="SIGN IN: Testing">
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
String passwd= "yongchak";

String tempemail,temppasswd,tempfname,templname,tempaddress,tempgender,tempcontactno;int tempcreditcardno;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=yongchak");
	
	  //statement query
	 Statement state =connect.createStatement();
	
	
	  ResultSet result = state.executeQuery("select * from customer where username='"+email+"'");
	
	  if(result.next()){
		   tempemail = result.getString("username");
			temppasswd=result.getString("password");
			tempfname=result.getString("first_name");
			templname=result.getString("last_name");
			tempaddress=result.getString("address");
			tempgender=result.getString("gender");
			tempcontactno=result.getString("contact_no");
			tempcreditcardno=result.getInt("credit_card_no");
			
		    if(tempemail.equals(email) && temppasswd.equals(passwd))
			{
				flag=1;
				String fname=tempfname;
				String lname=templname;
				String password=temppasswd;
				String address=tempaddress;
				String gender=tempgender;
				String contactno=tempcontactno;
				int creditcardno=tempcreditcardno;
				session.setAttribute("userName",email);
				session.setAttribute("firstname",fname);
				session.setAttribute("lastname",lname);
				session.setAttribute("passwrd",password);
				session.setAttribute("ADDress",address);
				session.setAttribute("Gender",gender);
				session.setAttribute("contactno",contactno);
				session.setAttribute("creditcardno",creditcardno);
				
				pageContext.setAttribute("email1", tempemail);
				pageContext.setAttribute("pwd1", temppasswd);
				
			}
	
	  }
pageContext.setAttribute("mail", email);
pageContext.setAttribute("pwd", passwd);
%>

<tagunit:assertEquals name="SIGN IN: Email matching">
  <tagunit:actualResult>
    <c:choose>
        <c:when test="${ mail==email1}">
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
pageContext.setAttribute("flag", flag);
%>

<tagunit:assertEquals name="SIGN IN: Password matching">
  <tagunit:actualResult>
    <c:choose>
        <c:when test="${ pwd==pwd1}">
         Password matched!!
        </c:when>
        <c:otherwise>
		<c:out value="${pwd}"/>
         Password doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
   Password matched!!
  </tagunit:expectedResult>
</tagunit:assertEquals>

<tagunit:assertEquals name="SIGN IN: Flag Matching">
  <tagunit:actualResult>
    <c:out value="${flag}"/>
  </tagunit:actualResult>
  <tagunit:expectedResult>1</tagunit:expectedResult>
</tagunit:assertEquals>

<%
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