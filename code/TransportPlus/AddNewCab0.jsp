<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String RequestID = request.getParameter("RequestID");%>

<HTML>
<HEAD>
		<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		<LINK href="styles.css" type="text/css" rel="stylesheet">
		<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>

	<script LANGUAGE="Javascript" SRC="">
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
			    if(ChkMandatoryField(frm.CabRegNo,'CabRegNo')==false) return false;
			    if(ChkMandatoryField(frm.DriverCode,'DriverCode')==false) return false;
			    if(ChkMandatoryField(frm.TravelsName,'TravelsName')==false) return false;
		}

	</script>
	
</HEAD>
<body class=Grad>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=2){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<H2 align=center>Add Cab Details</H2>
<FORM ACTION="AddNewCab1.jsp" onsubmit="return validate()">
	<center>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	<TR class=row_title>
		<TH colspan=2>Add Cab Details</th>
	</TR>

		<TR class=row_odd><td>CabRegNo
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='CabRegNo' value=''>
		</TR>
		
		<TR class=row_even><td>DriverCode
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='DriverCode' value=''>
		</TR>
		
		<TR class=row_odd><td>TravelsName
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='TravelsName' value=''>
		</TR>
		<Input type=hidden name='RequestID' value='<%=RequestID%>'>
		<TR class=row_even>
		<TH><INPUT TYPE="submit" value='Submit'></TH>
		<TH><INPUT TYPE="reset" value='Clear'></TH></TR>
</TABLE>
</center>
		<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>

</FORM>
</BODY>
<%
}
%>
