<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<HEAD>
		  <LINK href="styles.css" type="text/css" rel="stylesheet">
	 	  <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	 	  <script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		  <script LANGUAGE="Javascript" SRC="">
				function ChkMandatoryField(F,T){
					var val= F.value;
					if(val==""){alert(T+" is mandatory");return false;}
				}
				function ChkNumField(F,T){
					var val = F.value;
					if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
				}
				function ChkNameField(F,T){
					var val = F.value;
					var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;

					if(Npattern.test(val)) 
					return true
						{alert("Please enter valid name for "+T);
						return false;}
				}
				function validate()
				{
					var frm = document.forms(0);
					
						if(ChkMandatoryField(frm.RouteCode,'RouteCode')==false) return false;
						if(ChkMandatoryField(frm.Destination,'Destination')==false) return false;
						if(ChkNameField(frm.Destination,'Destination')==false) return false;
						if(ChkMandatoryField(frm.InBoundTime,'InBoundTime')==false) return false;
						if(validateTime(frm.InBoundTime)==false) return false;
						if(ChkMandatoryField(frm.OutBoundtime,'OutBoundtime')==false) return false;
						if(validateTime(frm.OutBoundtime)==false) return false;
						if(ChkMandatoryField(frm.BusID,'BusID')==false) return false;
						if(ChkMandatoryField(frm.Location,'Location')==false) return false;
						
				}


	</script>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<Body class=Grad>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=0){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<H2 align=center>AddNewRoute</H2>
<FORM ACTION="AddNewRoute1.jsp" onsubmit="return validate()">
	
<CENTER>	

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2">Add New Route</TH>
	   </TR>
		
		<TR class=row_even><td>RouteCode
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='RouteCode' value=''>
		</TR>
		
		<TR class=row_odd><td>Destination
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='Destination' value=''>
		</TR>
		
		<TR class=row_even><td>InBoundTime
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='InBoundTime' value=''> HH:MM
		</TR> 
		
		<TR class=row_odd><td>OutBoundtime
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='OutBoundtime' value=''> HH:MM
		</TR>
		
		<TR class=row_even><td>BusID
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='BusID' value='' readonly><INPUT TYPE="Button" Name="GBid" value="..." Onclick="fnEmpPopUp('ShowBusDetails.jsp',300,400);">
		</TR>
		
		<TR class=row_odd><td>Location
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='Location' value=''>
		</TR>
	
<Input type=hidden name='ActiveStatus' value='1'>

		
		
		<TR class=row_even><TH>
		<INPUT TYPE="submit" value='Submit'></TH>
		<TH><INPUT TYPE="reset" value='Clear'></TH></TR>
</TABLE>
		<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>

</FORM>
</BODY>

<%
}
%>