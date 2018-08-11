<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.TransportPortal.MyFunctions"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		function fnShowDetails(RequestID)
			{
				var URL = "ShowCabRequests.jsp?RequestID="+RequestID;
				fnEmpPopUp(URL,300,400);
			}
		

	//-->
	</SCRIPT>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><BODY class="Grad">
<h2 align="center">Request for a cab</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String RequestID = "";	
	MyFunctions MF = new MyFunctions();
	RequestID = MF.genNextID("cabrequest","RequestID","RC");

	String EmpNo = request.getParameter("EmpNo");	
	String EmpMailID = request.getParameter("EmpMailID");	
	String DateOfRequest = request.getParameter("DateOfRequest");	
	String Time = request.getParameter("Time");	
	String From = request.getParameter("From");	
	String To = request.getParameter("To");	
	String CabID = "";	
	String ApproversMailID = request.getParameter("ApproversMailID");	
	String Status = request.getParameter("Status");	
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Insert into cabrequest values('"+RequestID+"','"+EmpNo+"','"+EmpMailID+"','"+DateOfRequest+"','"+Time+"','"+From+"','"+To+"','"+CabID+"','"+ApproversMailID+"','"+Status+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
					<h3 align=center>Request placed successfully</h3>
					<h3 align=center>Your Request id is: <B><A onclick="fnShowDetails('<%=RequestID%>')" ><U><%=RequestID%></U></A></B> </h3>
				<%
			}
			else{
				%><h3 align=center>Error in updating..please try again</h3><% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


