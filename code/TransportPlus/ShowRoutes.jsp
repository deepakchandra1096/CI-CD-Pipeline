
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>List Available Routes</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val)
{
		var txt = window.opener.document.forms(0).RouteCode;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).RouteID;
		txt1.value = txt1Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body  class="SC">

<h2 align=center>Route Details</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="RouteID";
String RouteCode,Destination,InBoundTime,OutBoundtime,Location,RouteID;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "RouteID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);
String Condition = (String)request.getParameter("RouteID");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM routemaster";

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
	<th class=row_title><a class=title href="ShowRoutes01.jsp?orderby=RouteCode">RouteCode</a></th>
	<th class=row_title><a class=title href="ShowRoutes01.jsp?orderby=RouteID">RouteID</a></th>
    <th class=row_title><a class=title href="ShowRoutes01.jsp?orderby=Destination">Destination</a></th>
	<th class=row_title><a class=title href="ShowRoutes01.jsp?orderby=InBoundTime">InBoundTime</a></th>
	<th class=row_title><a class=title href="ShowRoutes01.jsp?orderby=OutBoundtime">OutBoundtime</a></th>
	<th class=row_title><a class=title href="ShowRoutes01.jsp?orderby=Location">Location</a></th>
	

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{RouteID=rs.getString(1);
	RouteCode=rs.getString(2);
	   Destination=rs.getString(3);
	   InBoundTime=rs.getString(4);
	   OutBoundtime=rs.getString(5);
	   Location=rs.getString(7);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=RouteCode%>','<%=RouteID%>')"><%=RouteCode%></a></td>
		<td><%=RouteID%></td>
		<td><%=Destination%></td>
		<td><%=InBoundTime%></td>
		<td><%=OutBoundtime%></td>
		<td><%=Location%></td>

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

