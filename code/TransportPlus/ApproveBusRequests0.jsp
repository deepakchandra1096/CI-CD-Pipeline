<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String RequestID = request.getParameter("RequestID");%>
 <% String Status = request.getParameter("Status");%>
 <% String EmpNo = request.getParameter("EmpNo");
 %>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
<!--

function validate()
{
		var RequestID = "<%=RequestID%>";
		var EmpNo = "<%=EmpNo%>";
		var cbox = document.getElementsByName("RequestID");
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
			URL = "ApproveBusRequest1.jsp";
			document.forms(0).action=URL;
			document.forms(0).submit();
			return true;
		}else{
			alert("Warning: Please select atleast one RequestID  to continue.");
			return false;
		}
}

//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=Grad>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=2){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<form name="ApproveForm" >
<h2 align=center>View Requests</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String RouteCode,Location,Address,PickupPoint,CategoryCode;
	Date StartDate;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from busrequest where Status=\'Open\'";
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
					{%>

						<table class=notebook align=center>
							<tr class=row_title>
							<th class=row_title>Select</th>
							<th class=row_title>RequestID</th>
							<th class=row_title>EmpNo</th>
							<th class=row_title>RouteCode</th>
							<th class=row_title>Location</th>
							<th class=row_title>Address</th>
							<th class=row_title>StartDate</th>
							<th class=row_title>PickupPoint</th>
							<th class=row_title>Status</th>

							</tr>
					<%
			int DisRow=0;
	while(rs.next())
		{
			RequestID=rs.getString(1);
			EmpNo =rs.getString(2);
			RouteCode=rs.getString(3);
			Location=rs.getString(5);	
			Address=rs.getString(6);
			StartDate=rs.getDate(7);
			PickupPoint=rs.getString(9);
			Status=rs.getString(8);
			CategoryCode=rs.getString(4);
			DisRow++;
					%>

						<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><INPUT TYPE="checkbox" NAME="RequestID" value="<%=RequestID%>"></td>
						<td align=center><%=RequestID%></td>
						<td align=center><%=EmpNo%><INPUT TYPE="hidden" NAME="EmpNo" Value="<%=EmpNo%>"></td>
						<td align=center><%=RouteCode%></td>
						<td align=center><%=Location%></td>
						<td align=center><%=Address%></td>
						<td align=center><%=StartDate%></td>
						<td align=center><%=PickupPoint%></td>
						<td align=center><%=Status%></td>
					<%
	}

	rs.close();
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
			<tr><th colspan=10>No Records found</th></tr>
	<%

}else{
	%>
			<tr>
			<th colspan=8>
			<INPUT TYPE="Button" Name="D" Value="Approve" onclick="validate();"></th>
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

