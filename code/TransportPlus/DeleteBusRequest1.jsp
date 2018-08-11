

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>

<BODY class=Grad>
<h2 align=center>Cancel BusRequest</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Value = request.getParameter("RequestID");
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Update busrequest SET busrequest.Status = 'Cancel', busrequest.ActiveStatus=0 where RequestID='"+Value+"'";
			int result = stmt.executeUpdate(Query);
			System.out.println(Query);
			if( result > 0)	{
				%><h3 align=center>RequestCanceled sucessfully</h3>
				<center>
				<A href="mynewmenu.jsp"> Back</A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error: Please try again</h3>
				<center>
				<A href="DeleteBusRequest0.jsp"> Back</A>
				</center>
				
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>


