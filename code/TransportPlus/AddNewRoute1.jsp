<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.TransportPortal.MyFunctions"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

</HEAD>

<jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=Grad>
<h2 align=center>Add NewRoute</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
		String RouteCode = request.getParameter("RouteCode");	
		String Destination = request.getParameter("Destination");
		String InBoundTime = request.getParameter("InBoundTime");	
		String OutBoundtime = request.getParameter("OutBoundtime");
		String BusId = request.getParameter("BusID");	
		String Location = request.getParameter("Location");
		String ActiveStatus = request.getParameter("ActiveStatus");	
		MyFunctions MF = new MyFunctions();
		String RouteId = MF.genNextID("routemaster","RouteID","R");
	try{

			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			
			String Query = "Insert into routemaster (RouteID,RouteCode,Destination,InBoundTime,OutBoundtime,BusId,Location)values('"+RouteId+"','"+RouteCode+"','"+Destination+"','"+InBoundTime+"','"+OutBoundtime+"','"+BusId+"','"+Location+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				String Query1="Update busmaster SET busmaster.ActiveStatus='2' where BusID='"+BusId+"'";
			int result1 = stmt.executeUpdate(Query1);
            System.out.println(Query1);
				%><h3 align=center>Route Created successfully</h3>
				<jsp:forward page="ViewRoutes.jsp">
						<jsp:param name="RouteID" value="<%=RouteId%>"/>
				</jsp:forward>
				<%
			}
			else{
				%><h3 align=center>Error:Please try again</h3><center>
				<A href="AddNewRoute0.jsp"> Back </A>
				</center><% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


