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
		function ChkNameField(F,T){
			var val = F.value;
			var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;

			if(Npattern.test(val)) {
			return true;
			}else{alert("Please enter valid name for "+T);
			 	return false;}
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
			    if(ChkMandatoryField(frm.EmpNo,'EmpNo')==false) return false;
			    if(ChkNumField(frm.EmpNo,'EmpNo')==false) return false;
				if(ChkMandatoryField(frm.EmpName,'EmpName')==false) return false;
			    if(ChkNameField(frm.EmpName,'EmpName')==false) return false;
				if(ChkMandatoryField(frm.EmpMailID,'Employee MailID')==false) return false;
			    if(validateEmailID(frm.EmpMailID,'Employee MailID')==false) return false;
				if(ChkMandatoryField(frm.Department,'Department')==false) return false;
			    if(ChkMandatoryField(frm.Designation,'Designation')==false) return false;
			    if(ChkMandatoryField(frm.PhoneNo,'PhoneNo')==false) return false;
				if(ChkNumField(frm.PhoneNo,'PhoneNo')==false) return false;
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
<H2 align=center>Add NewEmployee</H2>
<FORM ACTION="AddNewEmployee1.jsp" onsubmit="return validate()">
	

<TABLE class=notepad align=center width="30%">

<TR class=row_title>
	<TH colspan=2>Add NewEmployee</th>
</TR>
		
		<TR class=row_odd><td>EmpNo
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='EmpNo' value=''>
		</TR>
		
		<TR class=row_even><td>EmpName
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='EmpName' value=''>
		</TR>
		
		<TR class=row_odd><td>EmpMailID
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='EmpMailID' value=''>
		</TR>
		
		<TR class=row_even><td>Designation
		<FONT COLOR="red">*</td>
		<TD><select name=Designation>
		<option value="">--</option>
		<option value="TraineeSoftwareEngineer">Trainee Software Engineer</option>
		<option value="HRManager">HR Manager</option>
		<option value="ProjectLead">Project Leader</option>
		<option value="SoftwareEngineer">Software Engineer</option>
		<option value="TechLead">Tech Lead</option>
		<option value="HR">HR</option>
		<option value="Analyst">Analyst</option>
		<option value="Consultant">Consultant</option>
		<option value="ProjectManager">ProjectManager</option>

		</select>
		</TR>
		
		<TR class=row_odd><td>Department
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='Department' value=''>
		</TR>
		
		<TR class=row_even><td>PhoneNo
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='PhoneNo' value=''>
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

