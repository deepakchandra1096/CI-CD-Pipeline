<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.TransportPortal.MyFunctions"%>
<%	String RequestID = request.getParameter("RequestID");	
%>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
</HEAD>
<body class=Grad>
<h2 align=center>Add Cab Details</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String CabRegNo = request.getParameter("CabRegNo");	
	String DriverCode = request.getParameter("DriverCode");	
	String TravelsName = request.getParameter("TravelsName");
	MyFunctions MF = new MyFunctions();
	String CabID = MF.genNextID("cabmaster","CabID","CAB");

	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
	
			
			String Query = "Insert into cabmaster (CabID,CabRegNo,DriverCode,TravelsName)values('"+CabID+"','"+CabRegNo+"','"+DriverCode+"','"+TravelsName+"')";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
			String Query1 = "Update cabrequest SET CabID='"+CabID+"' where RequestID=\'"+RequestID+"\'";
			System.out.println(Query1);
			int result1 = stmt.executeUpdate(Query1);
				%><h3 align=center>Inserted into database sucessfully</h3>
				
				<%
			}
			else{
				%><h3 align=center>Error in updating..please try again</h3><% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
<center><input type=button value=close onclick="window.close()"></center>
</BODY>


