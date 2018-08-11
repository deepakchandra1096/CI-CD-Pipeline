<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>



</HEAD>
 <jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=Grad>
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=center>View Buses</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from busmaster order by `BusID`";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notebook align=center>
							<tr class=row_title>
							<th class=row_title>BusID</th>
							<th class=row_title>BusNo</th>
							<th class=row_title>BusType</th>
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
						
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center><th colspan=5>Sorry No records Found</th></h3><% }
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


