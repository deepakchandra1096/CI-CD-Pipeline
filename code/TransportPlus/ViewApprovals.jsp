<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>



</HEAD>
 <jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=SC>
<h2 align=center>View Approvals</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from approvals order by `ApprovalID`";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notebook>
							<tr class=row_title>
							<th class=row_title>ApprovalID</th>
							<th class=row_title>TypeOfRequest</th>
							<th class=row_title>RequestID</th>
							<th class=row_title>EmpNo</th>
							<th class=row_title>Status</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


