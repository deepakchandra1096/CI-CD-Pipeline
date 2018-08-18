

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
		function validateEmailID(x){
			var ed=x.value;
			var pattern = /^[a-zA-Z0-9\_\.]+\@[a-zA-Z\.]+\.([a-z]{2,4})$/;
			if(pattern.test(ed)) {
			return true;}
			else{
				alert("Please Enter valid Email ID" );
			return false;}
		}
		function validate()
		{
				var frm = document.forms(0);
			    if(ChkMandatoryField(frm.EmpNo,'Emp Number')==false) return false;
			    if(ChkMandatoryField(frm.EmpMailID,'Mail Id')==false) return false;
			    if(validateEmailID(frm.EmpMailID,'Mail Id')==false) return false;
				if(ChkMandatoryField(frm.DateOfRequest,'Date Of Request')==false) return false;
			    if(ChkMandatoryField(frm.Time,'Time')==false) return false;
				if(validateTime(frm.Time)==false) return false;
			    if(ChkMandatoryField(frm.From,'From')==false) return false;
			    if(ChkMandatoryField(frm.To,'To')==false) return false;
			    if(ChkMandatoryField(frm.ApproversMailID,'Approver\'s Mail Id')==false) return false;
				if(validateEmailID(frm.ApproversMailID,'Approver\'s Mail Id')==false) return false;

		}
	
	</script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><body  class="Grad">
<H2 align=center>Request for a Cab</H2>
<FORM ACTION="AddNewCabRequest1.jsp" onsubmit="return validate()">
	

<TABLE class=notepad align=center width="40%">
<TR  class=row_title>
	<TH class=row_title colspan=2>Cab Request</TH>			
</TR>
<TR class=row_odd>
	<TD><B>EmpNo</B><FONT COLOR="red">*</font></TD>
	<TD><Input type=text name='EmpNo' value=''>
</TR>
<TR class=row_even>
	<TD><B>EmpMailID</B><FONT COLOR="red">*</font></TD>
	<TD><Input type=text name='EmpMailID' value=''>
</TR>
<TR class=row_odd>
	<TD><B>Date of Request</B><FONT COLOR="red">*</font></TD>
	<TD><Input type=text name='DateOfRequest' value='' readonly>
	<img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
</TR>
<TR class=row_even>
	<TD><B>Time</B><FONT COLOR="red">*</font></TD>
	<TD><Input type=text name='Time' value=''> HH:MM
</TR>
<TR class=row_odd>
	<TD><B>From</B><FONT COLOR="red">*</font></TD>
	<TD><Input type=text name='From' value=''>
</TR>
<TR class=row_even>
	<TD><B>To</B><FONT COLOR="red">*</font></TD>
	<TD><Input type=text name='To' value=''>
</TR>
<TR class=row_odd>
	<TD><B>Approver's Mail Id</B><FONT COLOR="red">*</font></TD>
	<TD><Input type=text name='ApproversMailID' value=''readonly ><input type="button" ID='Item' value="..." Onclick="fnEmpPopUp('ShowApproversMailID.jsp',300,400);"></TR>

	<Input type="hidden" name='Status' value='Open'>

<TR class=row_even>
	<TH><INPUT TYPE="submit" value='Submit'></TH>
	<TH><INPUT TYPE="reset" value='Clear'></TH>
</TR>
</TABLE>
		<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</font></TD></FONT> are mandatory </H6>

</FORM>
</BODY>

