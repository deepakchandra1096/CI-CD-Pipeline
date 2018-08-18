

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% 
	String RouteID = request.getParameter("RouteID");
	/*String pStr = request.getParameter("pStr");
	pStr = pStr.replaceAll("-","','");
	System.out.println(pStr);*/
	String pStr = "'";
	String[] PickupPoints = request.getParameterValues("PickupPoint");
	for(int i=0;i<PickupPoints.length;i++){
		pStr+=PickupPoints[i]+"','";
	}
	System.out.println(pStr);
	pStr = pStr.substring(0,pStr.length()-2);
	System.out.println(pStr);

 %>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
</HEAD>
<BODY class=Grad>
<h2 align=center>Delete Pickup points</h2>
<%
	Connection con;
	ResultSet rs=null;
	Statement stmt=null,stmt1=null;
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Delete from  routeDetails where RouteID='"+RouteID+"' and Pickuppoint in ("+pStr+")";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			System.out.println(result);
			if(result>0)	{
					%><h3 align=center>Pickup points deleted sucessfully</h3><%
			}
			else{
				%><h3 align=center>Error: Please try again</h3>
				<center>
				<A href="DeletePickupDetails0.jsp?RouteID=<%=RouteID%>"> Back</A>
				</center>
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
<center><input type=button value=close onclick="window.close()"></center>
</BODY>


