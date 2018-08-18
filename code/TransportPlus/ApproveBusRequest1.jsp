

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% 
	String[] EmpNo = request.getParameterValues("EmpNo");
	/*String pStr = request.getParameter("pStr");
	pStr = pStr.replaceAll("-","','");
	System.out.println(pStr);*/
	String pStr = "'";
	String[] RequestID = request.getParameterValues("RequestID");
	for(int i=0;i<RequestID.length;i++){
		pStr+=RequestID[i]+"','";
	}
	System.out.println(pStr);
	pStr = pStr.substring(0,pStr.length()-2);
	System.out.println(pStr);

 %>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=Grad>
<h2 align=center>Approve Bus Request</h2>
<%
	Connection con;
	ResultSet rs=null;
	Statement stmt=null,stmt1=null;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Update busrequest SET Status='Approved' where Status=\'Open\' and RequestID in ("+pStr+")";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			System.out.println(result);
			if(result>0)	{
				%><h3 align=center>RequestApproved sucessfully</h3>
				<center>
				<A href="ApproveBusRequests0.jsp"> Back</A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error: Please try again</h3>
				<center>
				<A href="ApproveBusRequests0.jsp"> Back</A>
				</center>
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>


