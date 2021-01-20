<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><h2>LETTER</h2></center>
<h3 align="center">REQUEST GRANTED!!!!</h3>
<h3 align="right"><%String date=(String)session.getAttribute("date");
out.println(date);
%></h3>
<h3 align="right">vaddeswaram</h3>
<h3 align="left">SUB:&nbsp;permission status</h3>
<p>To <br>mr.<%
String uname=(String)session. getAttribute("uname");
out.println(uname);%><br>&nbsp; your request for leave is granted...<br><br><br>
purpose of leave:<%
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");  
System.out.println("Connection Established");
 
PreparedStatement pstmt = con.prepareStatement("select * from request where username=?");
pstmt.setString(1,uname);
ResultSet rs=pstmt.executeQuery();
if(rs.next())
{
	out.println(rs.getString(3));
}

%>
</p>
<br>
<br>
</body>
</html>