<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">	
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

    <TITLE>Approve CabRequest</TITLE>
	
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var EmpMailID = document.CabReqForm.EmpMailID.value;
		var EmpNo = document.CabReqForm.EmpNo.value;
		var pattern = /^[a-zA-Z0-9\_\.]+\@[a-zA-Z\.]+\.([a-z]{2,4})$/;

		if(EmpNo==""){
			alert("Employee Number is mandatory");
			document.CabReqForm.EmpNo.focus();
			return false;
		          }
		
		if(EmpMailID=="")
			{
			alert("Employee Mail ID is mandatory");
			document.CabReqForm.EmpMailID.focus();
			return false;
			}
			else{ 
				if(!(pattern.test(EmpMailID))) 
					{
					alert("Please Enter valid Email ID" );
					return false;
					}
					return true;
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

if(auth!=1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<H2 align =center>Approve CabRequest</H2>

  <FORM NAME="CabReqForm" onSubmit="return check()" action="ApproveCabRequests1.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Approve BusRequest </TH>
	   </TR>

	   <TR class=row_even >
	   <TD>Enter Your Employee No*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EmpNo" SIZE="15" value=''></TD>
		</TR>
	 
	   <TR class=row_even >
	   <TD>Enter Your MailID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EmpMailID" SIZE="15" value=''></TD>
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