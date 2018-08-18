<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">	
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

    <TITLE>View BusRequest</TITLE>
	
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var EmpNo = document.ViewForm.EmpNo.value;
		if(EmpNo==""){
			alert("Employee No is mandatory");
			document.ViewForm.EmpNo.focus();
			return false;
		}
		
	return true;
	}

	//-->
	</SCRIPT>
  </HEAD>
    <jsp:include page="MultiLevelmenu.htm"/><br><br><br>
  <body Class=Grad>

<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth<0){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<H2 align =center>View BusRequest</H2>

  <FORM NAME="ViewForm" onSubmit="return check()" action="ViewBusRequests.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2">View BusRequest </TH>
	   </TR>
	   <TR class=row_even >
	   <TD>Enter EmployeeNo *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EmpNo" SIZE="10" value=''></TD>
		</TR>
	 
	   </TD>
	   <TR class=row_even  ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Submit" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Clear"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
 <%
  }
  %>