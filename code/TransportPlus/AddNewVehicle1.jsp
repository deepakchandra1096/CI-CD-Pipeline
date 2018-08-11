<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.TransportPortal.MyFunctions"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>



</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<body class=Grad>
<h2 align=center>Add NewVehicle</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String BusNo = request.getParameter("BusNo");	
	String BusType = request.getParameter("BusType");
	MyFunctions MF = new MyFunctions();
		String BusID = MF.genNextID("busmaster","BusID","B");
	try{
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			
			String Query = "Insert into busmaster (BusID,BusNo,BusType)values('"+BusID+"','"+BusNo+"','"+BusType+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Vehicle details added sucessfully</h3>
				<center>
				<A href="AddNewVehicle0.jsp"> Add another </A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error:Please try again</h3><center>
				<A href="AddNewVehicle0.jsp"> Back </A>
				</center><% 			}
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


