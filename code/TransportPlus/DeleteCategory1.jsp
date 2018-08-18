

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>

<BODY class=Grad>
<h2 align=center>Cancel Category</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Value = request.getParameter("CategoryID");
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Delete from categorymaster where CategoryID='"+Value+"'";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Deleted Category sucessfully</h3>
				<center>
				<A href="DeleteCategory0.jsp"> Cancel another Category </A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error: Please try again</h3>
				<center>
				<A href="DeleteCategory0.jsp"> Back</A>
				</center>
				
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>


