<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

 <% String RouteID = request.getParameter("RouteID");%>

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

		function validate()
		{
			var frm = document.forms(0);
			
				
			    if(ChkMandatoryField(frm.EmpNo,'EmpNo')==false) return false;
				if(ChkNumField(frm.EmpNo,'EmpNo')==false) return false;
				if(ChkMandatoryField(frm.RouteCode,'RouteCode')==false) return false;
				if(ChkMandatoryField(frm.Location,'Location')==false) return false;
				if(ChkMandatoryField(frm.Address,'Address')==false) return false;
				if(ChkMandatoryField(frm.StartDate,'StartDate')==false) return false;
			    if(ChkMandatoryField(frm.PickupPoint,'PickupPoint')==false) return false;
			
		}
function fnPickUpDetails()
			{
		var frm = document.forms(0);
		var RouteID = frm.RouteID.value;
		if (RouteID=='')
		{
			alert("Please Enter RouteID to Proceed");
		}else
				{var URL = "ShowPickUpPoints.jsp?RouteID="+RouteID;
			fnEmpPopUp(URL,300,400);
			}
		}

	</script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<body class=Grad>
<H2 align=center>Request Bus pass</H2>
<FORM ACTION="AddBusRequest1.jsp" onsubmit="return validate()">
	

<TABLE class=notepad align=center width="30%">

<TR class=row_title>
	<TH colspan=2>Request Bus pass</th>
</TR>
<TR class=row_odd>
	<TD>EmpNo	<FONT COLOR="red">*</font></td>			
	<TD><Input type=text name='EmpNo' value=''></td>
</TR>
<TR class=row_even>
	<TD>RouteCode<FONT COLOR="red">*</font></td>
	<TD><Input type=text name='RouteCode' value=''readonly><INPUT TYPE="Button" Name="GBid" value="..." Onclick="fnEmpPopUp('ShowRoutes.jsp',300,400);">
		
</TR>
<Input type=hidden name='RouteID' value='<%=RouteID%>'>

<TR  class=row_odd>
	<TD>Location<FONT COLOR="red">*</font></td>
	<TD><Input type=text name='Location' value=''></td>
</TR>
<TR  class=row_even>
	<TD>Address<FONT COLOR="red">*</font></td>
	<TD><textarea name=Address></textarea></td>
</TR>
<TR  class=row_odd>
	<TD>StartDate<FONT COLOR="red">*</font></td>
	<TD><Input type=text name='StartDate' value='' readonly>
	<img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></td>
</TR>
<TR  class=row_even>
	<TD>Pickup Point<FONT COLOR="red">*</font></td>
	<TD><Input type=text name='PickupPoint' value='' readonly>
	<INPUT TYPE="Button" Name="GBid" value="..." Onclick="fnPickUpDetails()">
	<Input type=hidden name='Distance' value='1'></TD>

</TR>
<Input type=hidden name='ActiveStatus' value='1'>

<TR  class=row_even>
	<Th ><INPUT TYPE="submit" value='Submit'></TH><Th ><INPUT TYPE="reset" value='Clear'></TH>
</TR>
</TABLE>
		<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</font></td></FONT> are mandatory </H6>
</FORM>
</BODY>

