<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	String EmpNo=request.getParameter("EmpNo");

%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	<!--
		function fnShowDetails(CabID,U)
			{
				var URL = U+"?CabID="+CabID;
				fnEmpPopUp(URL,300,400);
			}
	//-->
	</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=Grad>
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>

<h2 align=center>View CabRequests</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from cabrequest where EmpNo='"+EmpNo+"'";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notebook align=center>
							<tr class=row_title>
							<th class=row_title>RequestID</th>
							<th class=row_title>EmpNo</th>
							<th class=row_title>EmpMailID</th>
							<th class=row_title>DateOfRequest</th>
							<th class=row_title>Time</th>
							<th class=row_title>From</th>
							<th class=row_title>To</th>
							<th class=row_title>CabID</th>
							<th class=row_title>ApproversMailID</th>
							<th class=row_title>Status</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{   
				String CabID=rs.getString(8);
				String RequestID = rs.getString(1);
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><%=RequestID%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						<td align=center><%=rs.getString(4)%></td>
						<td align=center><%=rs.getString(5)%></td>
						<td align=center><%=rs.getString(6)%></td>
						<td align=center><%=rs.getString(7)%></td>
						<%if(CabID==null||CabID.equals("")){
							CabID = "Not Assigned";
							%><td align=center><%=CabID%></td><%
						}else{%>
							<td align=center><A onclick="fnShowDetails('<%=CabID%>','ViewCabs.jsp')"><%=CabID%></A></td>
						<%}%>
						<td align=center><%=rs.getString(9)%></td>
						<td align=center><B><FONT COLOR="#CC0033"><%=rs.getString(10)%></B></FONT></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center><th colspan=11>Sorry No records Found</th></h3><% }
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


