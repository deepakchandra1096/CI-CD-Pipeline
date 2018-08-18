<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% String RouteID="";%>
<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		function fnShowDetails(RouteId,U)
			{
				var URL = U+"?RouteID="+RouteId;
				fnEmpPopUp(URL,300,400);
			}
	//-->
	</SCRIPT>

</HEAD>

<jsp:include page="MultiLevelmenu.htm"/><br><br><body  class=Grad>
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>

<h2 align=center>ViewRoutes</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from routemaster where ActiveStatus=1 order by `RouteID`";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notebook align=center>
							<tr class=row_title>
							<th class=row_title>RouteID</th>
							<th class=row_title>RouteCode</th>
							<th class=row_title>Destination</th>
							<th class=row_title>InBoundTime</th>
							<th class=row_title>OutBoundtime</th>
							<th class=row_title>BusNo</th>
							<th class=row_title>Location</th>
							<th class=row_title colspan=3>Pickup Points</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{RouteID=rs.getString(1);
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><%=RouteID%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						<td align=center><%=rs.getString(4)%></td>
						<td align=center><%=rs.getString(5)%></td>
						<td align=center><%=rs.getString(6)%></td>
						<td align=center><%=rs.getString(7)%></td>
						<td align=center><A onclick="fnShowDetails('<%=RouteID%>','ViewPickupDetails.jsp')">View</A></td>
						<td align=center><A onclick="fnShowDetails('<%=RouteID%>','AddPickUpDetails0.jsp')">Add</A></td>
						<td align=center><A onclick="fnShowDetails('<%=RouteID%>','DeletePickupDetails0.jsp')">Remove</A></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center><th colspan=9>Sorry No records Found</th></h3><% }

		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


