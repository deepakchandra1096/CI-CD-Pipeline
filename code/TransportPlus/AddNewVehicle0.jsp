<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

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
				if(ChkMandatoryField(frm.BusNo,'BusNo')==false) return false;
				if(ChkMandatoryField(frm.BusType,'BusType')==false) return false;
				
		}


	</script>
	
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<body class=Grad>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=0){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<H2 align=center>Add NewVehicle</H2>
<FORM ACTION="AddNewVehicle1.jsp" onsubmit="return validate()">
<CENTER>	

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2">Add NewVehicle</TH>
	   </TR>
		
		<TR class=row_even><td>BusNo
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='BusNo' value=''>
		</TR>
		
		<TR class=row_odd><td>BusType
		<FONT COLOR="red">*</td>
		<TD><select name=BusType>
		<option value="">--</option>
		<option value="Own">Own</option>
		<option value="Hire">Hire</option>
		</select>
		</TR>
			
		<TR class=row_even>
		<TH><INPUT TYPE="submit" value='Submit'></TH>
		<TH><INPUT TYPE="reset" value='Clear'></TH></TR>
</TABLE>
		<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>

</FORM>
</BODY>
<%
}
%>
