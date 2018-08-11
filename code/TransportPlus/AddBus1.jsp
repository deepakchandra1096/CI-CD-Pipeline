<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<h2 align=center>AddBusDetails</h2>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String BusType = request.getParameter("BusType");	String BusNumber = request.getParameter("BusNumber");	String Capacity = request.getParameter("Capacity");	String TravelsId = request.getParameter("TravelsId");	
	try{
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection("jdbc:odbc:ewheelz","root","");
			stmt =  con.createStatement();
	
			
			String Query = "Insert into busmaster values('"+BusType+"','"+BusNumber+"',"+Capacity+",'"+TravelsId+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h3 align=center>Inserted into database sucessfully</h3><%
			}
			else{
				%><h3 align=center>Error in updating..please try again</h3><% 
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>


