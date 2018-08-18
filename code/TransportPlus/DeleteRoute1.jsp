

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String RouteID = request.getParameter("RouteID");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>

<BODY class=Grad>
<h2 align=center>Cancel Route</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null,stmt1=null;
	String Value = request.getParameter("RouteID");
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Delete from  routemaster where RouteID='"+Value+"'";
			int result = stmt.executeUpdate(Query);
			System.out.println(Query);
			System.out.println(result);
System.out.println(RouteID);

			if(result>0)	{
				//System.out.println(RouteID);

				String Query1 = "Delete from routedetails where RouteID='"+RouteID+"'";
				//System.out.println(Query1);
				int res = stmt.executeUpdate(Query1);
				//System.out.println(Query1);
					%><h3 align=center>Deleted route details sucessfully</h3>
					<center>
					<A href="DeleteRoute0.jsp"> Cancel another Route </A>
					</center>
					<%
			}
			else{
				%><h3 align=center>Error: Please try again</h3>
				<center>
				<A href="DeleteRoute0.jsp"> Back</A>
				</center>
				
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>


