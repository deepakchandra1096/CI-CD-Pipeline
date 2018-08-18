<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=Grad>
<h2 align=center>Add NewCategory</h2>

<%
	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String CategoryCode = request.getParameter("CategoryCode");	
	String Amount = request.getParameter("Amount");	
	String Distance = request.getParameter("Distance");	
	String MinDistance = request.getParameter("MinDistance");	
	try{
			
			con = (Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			
			String Query = "Insert into categorymaster(CategoryCode,Amount,Distance,MinDistance) values('"+CategoryCode+"',"+Amount+","+Distance+","+MinDistance+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Category Created sucessfully</h3>
				<center>
				<A href="AddNewCategory0.jsp"> Add another </A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error: Please try again</h3>
				<center>
				<A href="AddNewCategory0.jsp"> Back </A>
				</center>	
				<% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


