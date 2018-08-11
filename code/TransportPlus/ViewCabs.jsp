<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String CabID = request.getParameter("CabID");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
</HEAD>

<BODY class=Grad>

<h2 align=center>View Cab Details</h2>
<center><input type=button value=close onclick="window.close()"></center>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from cabmaster where CabID='"+CabID+"'";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notebook align=center>
							<tr class=row_title>
							<th class=row_title>CabID</th>
							<th class=row_title>CabRegNo</th>
							<th class=row_title>DriverCode</th>
							<th class=row_title>TravelsName</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><%=rs.getString(1)%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						<td align=center><%=rs.getString(4)%></td>
						
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center><th colspan=5>Sorry No records Found</th></h3><% }
		}catch(Exception e){%><%=e%><%}
	
%>

</BODY>


