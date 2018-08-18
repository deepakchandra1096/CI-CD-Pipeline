<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<body class=Grad>
<h2 align=center>AddNewEmployee</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String EmpNo = request.getParameter("EmpNo");
	String EmpName = request.getParameter("EmpName");
	String EmpMailID = request.getParameter("EmpMailID");
	String Department = request.getParameter("Department");
	String Designation = request.getParameter("Designation");
	String PhoneNo = request.getParameter("PhoneNo");	
	try{
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection("jdbc:odbc:Transport","root","");
			stmt =  con.createStatement();
	
			
			String Query = "Insert into employeemaster values('"+EmpNo+"','"+EmpName+"','"+EmpMailID+"','"+Department+"','"+Designation+"',"+PhoneNo+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Employ added sucessfully</h3>
				<center>
				<A href="AddNewEmployee0.jsp"> Add another </A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error: Please try again</h3>
				<center>
				<A href="AddNewEmployee0.jsp"> Try Again </A>
				</center>
				<% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


