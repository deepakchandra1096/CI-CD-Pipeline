
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String RequestID = request.getParameter("RequestID");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>List Cab Requests</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal)
{
		var txt = window.opener.document.forms(0).RequestID;
		txt.value = txtVal;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body  class="SC">

<h2 align=center>Request Details</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="RequestID";
String RouteCode,EmpNo,Location,Address,EmpMailID;
String Time,To,From,CabID,ApproversMailID;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "RequestID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);
String Condition = (String)request.getParameter("RequestID");
Date DateOfRequest;
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM cabrequest where RequestID ='"+RequestID+"'";

	System.out.println("--1--"+Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs!=null)
{
//System.out.println("Resultset is not null");

%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	<table class=notebook align=center>

	<tr class=row_title>
	<th class=row_title><a class=title href="ShowCabRequests.jsp?orderby=RequestID">RequestID</a></th>
	<th class=row_title><a class=title href="ShowCabRequests.jsp?orderby=EmpNo">EmpNo</a></th>
    <th class=row_title><a class=title href="ShowBusRequests.jsp?orderby=DateOfRequest">DateOfRequest</a></th>
	<th class=row_title><a class=title href="ShowCabRequests.jsp?orderby=Time">Time</a></th>
	<th class=row_title><a class=title href="ShowCabRequests.jsp?orderby=From">From</a></th>
	<th class=row_title><a class=title href="ShowCabRequests.jsp?orderby=To">To</a></th>

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	RequestID=rs.getString(1);
	EmpNo=rs.getString(2);
	DateOfRequest=rs.getDate(4);
	Time=rs.getString(5);
	From=rs.getString(6);
	  To=rs.getString(7);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=RequestID%>')"><%=RequestID%></a></td>
		<td><%=EmpNo%></td>
		<td><%=DateOfRequest%></td>
		<td><%=Time%></td>
		<td><%=From%></td>
		<td><%=To%></td>

	<%
	}


	rs.close();
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No Records found</th></tr>

		</CENTER>
	<%

}

}
%>
</table>
</form>
</BODY>
</HTML>

