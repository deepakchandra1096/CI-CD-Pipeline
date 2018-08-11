<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<%	
String AccessCodes="PU";

if(AccessCodes.equals("Null"))
{

	session.invalidate();
	%>
	<!--<H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">Session time out...Please login again</H5>-->
	<script language=javascript>
		location.replace('sessiontimeout.html');
	</script>
	
	
	<% 
}
else{
%>

<HEAD>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Kalyan">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT SRC="Images\validate.js"></SCRIPT>

<title>Consolidated Reprot</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
			function Toggle(node){
				// Expanding the Node
				if (node.nextSibling.style.display == 'none'){
					// Change the image (if there is an image)
					if (node.childNodes.length > 0){
						if (node.childNodes.item(0).nodeName == "IMG"){
							node.childNodes.item(0).src = "Images/up.png";
						}
					}
					node.nextSibling.style.display = 'block';
				}
				// Collapsing the Node
				else{
					// Change the image (if there is an image)
					if (node.childNodes.length > 0)	{
						if (node.childNodes.item(0).nodeName == "IMG"){
							node.childNodes.item(0).src = "Images/down.png";
							//location.reload();
						}
					}
					node.nextSibling.style.display = 'none';
				}
			}
			function GenURL(Page,Category,Condition,Title,TableName)
			{
				//alert("~~"+Category+Condition+Title);
				var URL = Page+"?";
				if(Category!=""){ P1 = "Category="+Category; URL+=P1;}
				if(Condition!=""){ P2 = "Condition="+Condition; URL+="&"+P2;}
				if(Title!=""){ P3 = "Title="+Title; URL+="&"+P3;}
				if(TableName!=""){ P4 = "TableName="+TableName; URL+="&"+P4;}
				//alert(URL);
				var Frm = document.GenReport;
				Frm.action=URL;
				Frm.submit();
			}
//-->
</SCRIPT>
</HEAD>


<jsp:include page="MultiLevelmenu.htm"/><BR><BR><BR><BODY  class="SC">

<form name="GenReport" action="">

<%
if(AccessCodes.indexOf("PU")>-1 || AccessCodes.indexOf("PR")>-1 ) {
/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;


int SNo;
String Status,TableName="",Category="Status";
Category = request.getParameter("Category");
TableName = request.getParameter("TableName");
String Condition = (request.getParameter("Condition")==null)? "" : request.getParameter("Condition");
String Title = (request.getParameter("Title")==null)? "" : request.getParameter("Title");

int NumOpps,Total=0;
String Qry;
try
{
	/*Getting the connection variable from session*/
	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	//Qry = "Select CandID,FirstName,Role,Location,DOJ,PrimarySkills,Tech,Status,HRCall,PhoneNo,EmailID,Remarks,ProjectBlocked,ExpLetter from FutureJoinees order by "+orderBy;

	Qry = "select "+Category+",count(*) from "+TableName+" group by "+Category;
	if(!(Condition==null||Condition.equals("")))
		{
			Qry = "select "+Category+",count(*) from "+TableName+" where "+Condition+" group by "+Category;
		}
	System.out.println(Qry+"+++++++++++++++++");
	rs = stmt.executeQuery(Qry);
}
catch(Exception e)
{
	%><%=e%><%
}

if(rs.first())
{
System.out.println("Resultset is not null");
rs.beforeFirst();

%>
	<!--Displaying the table header-->
	<center>
	<%
		if(!(Title==null||Title.equals("")))
		{
			%><H2><%=Title%> </H2><%
		}
		else
		{
			%><h2><%=Category%> Report</h2><%
		}
	%>
	<center>
	<br>
	<center><INPUT TYPE="submit" value="Download to Excel" onclick="GenURL('GenericReportExcel.jsp','<%=Category%>','<%=Condition%>','<%=Title%>','<%=TableName%>')"></center>
	<BR><BR>
	<table class=notepad width="60%">
	<tr class=row_title>
		<td align=center><B><%=Category%></B></tD>
		<td align=center><B> Count</B></tD>
	</tr>

<%
int DisRow=0;
	/*Getting the values from the database*/
															

	while(rs.next())
	{
      Status=rs.getString(1);
	  if(Status==null||Status.trim().equals("")){Status = "DATA AWAITED";}
	  NumOpps=rs.getInt(2);
	  Total+=NumOpps;
	  DisRow++;
	%>
	<!--Displaying the values from database-->
	<tr class=<%=(DisRow%2==0)?"row_odd":"row_even"%>>	
		<td align=center><%=Status%></td>
		<td align=center><%=NumOpps%></td>
	</tr>
	<%
	}
	%>
	<tr class=<%=((DisRow+1)%2==0)?"row_odd":"row_even"%>>	
		<td align=center><FONT  COLOR="Red">Total</FONT></td>
		<td align=center><FONT  COLOR="Red"><%=Total%></FONT></td>
	</tr>
	<%
	rs.close();
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");
	%>
		<CENTER>
		<B>No Records found............<B><BR>
		<A href="mynewmenu.jsp"> Home </A>
		</CENTER>
	<%

}
%>
</table>
<BR><BR>
<INPUT TYPE="hidden" NAME="Category" value="<%=Category%>">
<INPUT TYPE="hidden" NAME="Condition" value="<%=Condition%>">
<INPUT TYPE="hidden" NAME="Title" value="<%=Title%>">
<INPUT TYPE="hidden" NAME="TableName" value="<%=TableName%>">

<%
}
else{
	%><H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to view this page.</H5><%
}
%>

</form>
</BODY>
</HTML>
<%
}
%>
