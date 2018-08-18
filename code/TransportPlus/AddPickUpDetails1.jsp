<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>



</HEAD>
<BODY class=Grad>
<h2 align=center>Add PickUpPoints</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String RouteID = request.getParameter("RouteID");	
	String PickupPoint = request.getParameter("PickupPoint");
	String Distance = request.getParameter("Distance");	
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Insert into routedetails values('"+RouteID+"','"+PickupPoint+"',"+Distance+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Inserted into database sucessfully</h3>
				<center>
				<A href="AddPickUpDetails0.jsp?RouteID=<%=RouteID%>"> Add another PickUpPoint </A><br><br>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error:Please try again</h3>
				<center>
				<A href="AddPickUpDetails0.jsp?RouteID=<%=RouteID%>">Try Again </A><br><br>
				</center>
				<% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
<center><input type=button value=close onclick="window.close()"></center>

</BODY>


