<%@ taglib uri="http://www.tagunit.org/tagunit/core" prefix="tagunit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>


<tagunit:assertEquals name="SIGN UP: Testing">
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
String fname="syed";
String lname="ahamad";
String email="deepakjangid123@gmail.com";
String passwd1= "abhishek";
String passwd2= "abhishek";
String contact="9706266302";
String DOB="24-03-1996";
String address="mainpur";
String gender="M";
int creditcardno=34215643;


String tempemail;
int flag=0;
		
try{ 

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/ars?user=root&password=yongchak");
	
	  //statement query
	 Statement state =connect.createStatement();
	 
	 String a[]=new String[16];
	int i=0;
	
	  ResultSet result = state.executeQuery("select username from customer");
	
	  while(result.next()){
		   tempemail = result.getString("username");
			
			if(i<16)
			{
				a[i]=tempemail;
				i++;
				pageContext.setAttribute("a", a);
			}
			
		    if(tempemail.equals(email))
			{
				flag=1;
				
				pageContext.setAttribute("mail1",tempemail );
				break;
			}
			
	  }
	   pageContext.setAttribute("mail", email);
	   
	  %>
	  
	  <tagunit:assertEquals name="SIGN UP: Array of username">
  <tagunit:actualResult><c:forEach var="myVar" items="${a}"><c:out value="${myVar}"/></c:forEach></tagunit:actualResult>
  <tagunit:expectedResult>xyz</tagunit:expectedResult>
</tagunit:assertEquals>
	  
	  <tagunit:assertEquals name="SIGN UP: Email matching">
  <tagunit:actualResult>
    <c:set var="e2" value="${mail}"/>
    <c:choose>
        <c:when test="${ e2==mail1}">
		<c:out value="${e2}"/>
         Credential matched!!
        </c:when>
        <c:otherwise>
		<c:out value="${mail1}"/>
         Credential doesnot matched!!
        </c:otherwise>
    </c:choose>
  </tagunit:actualResult>
  <tagunit:expectedResult>
    syedahamad10@gmail.comCredential matched!!
  </tagunit:expectedResult>
</tagunit:assertEquals>
<%
pageContext.setAttribute("pwd1", passwd1);
pageContext.setAttribute("pwd2", passwd2);
pageContext.setAttribute("flag", flag);
%>

<tagunit:assertEquals name="SIGN UP: Password matching">
  <tagunit:actualResult>
    <c:choose>
        <c:when test="${ pwd1==pwd2}">
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

<tagunit:assertEquals name="SIGN UP: Flag Matching">
  <tagunit:actualResult>
    <c:out value="${flag}"/>
  </tagunit:actualResult>
  <tagunit:expectedResult>1</tagunit:expectedResult>
</tagunit:assertEquals> 
	  <%
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

%>
