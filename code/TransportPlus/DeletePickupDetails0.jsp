
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String RouteID = request.getParameter("RouteID");%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<title>List Available PickUp Points</title>
<SCRIPT LANGUAGE="JavaScript">
<!--

function validate()
{
		var RouteID = "<%=RouteID%>";
		var cbox = document.getElementsByName("PickupPoint");
		var pStr="";
		var cnt=0;
		if(cbox.length==undefined)
		{
			if(cbox.checked==true)
			{
				var val = cbox.value;
				pStr+=val;
				cnt++;
			}
		}
		else
		{
			for(i=0;i<cbox.length;i++)
			{
				if(cbox[i].checked == true)
				{
					var val = cbox[i].value;
					pStr+=val+"-";
					cnt++;	
				}
			}
			if(cnt!=0)
			{
					pStr = pStr.substring(0,pStr.length-1);
			}

		}
		if(cnt!=0){
			URL = "DeletePickupDetails1.jsp";
			document.forms(0).action=URL;
			document.forms(0).submit();
			return true;
		}else{
			alert("Warning: Please select atleast one pickup point to delete.");
			return false;
		}
}

//-->
</SCRIPT>
</HEAD>

<body  class="Grad">
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=0){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<h2 align=center>PickUp Point Details</h2>
<form name="delForm" >
<input type=hidden value="<%=RouteID%>" name="RouteID">
<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="RouteID";
String PickupPoint;
int Distance;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "RouteID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);
String Condition = (String)request.getParameter("RouteID");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM routedetails where RouteID ='"+RouteID+"'";
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
	<th class=row_title>Select</th>
	<th class=row_title>PickupPoint</th>
    <th class=row_title>RouteID</th>
	<th class=row_title>Distance</th>
	
	

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{RouteID=rs.getString(1);
	   PickupPoint=rs.getString(2);
	   Distance=rs.getInt(3);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><INPUT TYPE="checkbox" NAME="PickupPoint" value="<%=PickupPoint%>"></td>
		<td><%=PickupPoint%></td>
		<td><%=RouteID%></td>
		<td><%=Distance%></td>
	<%
	}

	rs.close();
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
			<tr><th colspan=6>No Records found</th></tr>
	<%

}else{
	%>
			<tr>
			<th colspan=6>
			<INPUT TYPE="Button" Name="D" Value="Delete" onclick="validate();"></th>
			</tr>
	<%
}

}
%>
</table>
</form>
</BODY>
</HTML>
<%
}
%>
