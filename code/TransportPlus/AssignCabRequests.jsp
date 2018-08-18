<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		function fnShowDetails(RequestID,U)
			{
				var URL = U+"?RequestID="+RequestID;
				fnEmpPopUp(URL,300,400);
			}
	//-->
	</SCRIPT>
</HEAD>

<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<BODY class=Grad>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=2){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>

<h2 align=center>View CabRequests</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from cabrequest where CabID=''";
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
        		String ApproversMailID=rs.getString(9);
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
							%><td align=center><A onclick="fnShowDetails('<%=RequestID%>','AddNewCab0.jsp')">Assign</A></td><%
														
						}else{%>
							<td align=center><A onclick="showDetails('<%=CabID%>')"><%=CabID%></A></td>
						<%}%>
						<td align=center><%=ApproversMailID%></td>
						<td align=center><B><FONT COLOR="#CC0033"><%=rs.getString(10)%></B></FONT></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center><th colspan=11>Sorry No records Found</th></h3><% }
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>
<%
}
%>

