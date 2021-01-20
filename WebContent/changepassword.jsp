<%@ page import="java.sql.*" %>
<%

String uname = (String)session.getAttribute("uname");
String cpwd = request.getParameter("cpwd");

try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");  
	 System.out.println("Connection Established");
	 PreparedStatement pstmt = con.prepareStatement("update employee set password=? where username=?");
	 pstmt.setString(1,cpwd);
	 pstmt.setString(2,uname);
	int n = pstmt.executeUpdate();
	if(n>0){
		%>
		<h3>Password Updated</h3>
		Employee Login---><a href="employee_login.html">Click here</a>
		Manager Login---><a href="manager_login.html">Click here</a>
		Leader Login---><a href="leader_login.html">Click here</a>
		<%
	}
	 
	else{
		%>
		<h3>Not Updated</h3>
		Home---><a href="home.html">Click Here</a>
		<%
	}
          
          
	 
}
catch(Exception e)
{
	out.println(e);
}
%>