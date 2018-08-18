<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.TransportPortal.MyFunctions"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><body  class=SC>
<h2 align=center>Request Bus pass</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
String EmpNo = request.getParameter("EmpNo");	
String RouteCode = request.getParameter("RouteCode");
String Location = request.getParameter("Location");
String Address = request.getParameter("Address");	
String StartDate = request.getParameter("StartDate");	
String PickupPoint = request.getParameter("PickupPoint");	
String Distance = request.getParameter("Distance");
String CategoryCode = "";


String Status="Open";
MyFunctions MF = new MyFunctions();
String RequestID = MF.genNextID("busrequest","RequestID","RB");
try{
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			/****** Reading Category Code from Category Master based on Distance ******/
			String dQry = "select `CategoryCode` from `categorymaster` where "+Distance+" >= MinDistance && "+Distance+" <= Distance;";
			rs = stmt.executeQuery(dQry);
			if(rs.next()){
				CategoryCode = rs.getString(1);
			}else{
				CategoryCode = "";
			}

			
			String Query = "Insert into busrequest (RequestID,EmpNo,RouteCode,CategoryCode,Location,Address,StartDate,Status,PickupPoint) values('"+RequestID+"','"+EmpNo+"','"+RouteCode+"','"+CategoryCode+"','"+Location+"','"+Address+"','"+StartDate+"','"+Status+"','"+PickupPoint+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Request placed sucessfully</h3>
				<center>
				<A href="mynewmenu.jsp"> Back </A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error:Please try again</h3><center>
				<A href="AddBusRequest0.jsp"> Back </A>
				</center><% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


