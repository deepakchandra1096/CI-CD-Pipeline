
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<BODY class=Grad>
<h2 align = center>Delete a Employee</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Value = request.getParameter("EmpName");
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Delete from employeemaster where EmpName='"+Value+"'";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Deleted from the database sucessfully</h3>
				<center>
				<A href="DelEmployee0.jsp"> Delete Another</A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error:Please try again</h3>
				<center>
				<A href="DelEmployee0.jsp"> Delete Another</A>
				</center>
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>