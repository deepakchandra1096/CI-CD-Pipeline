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
		function ChkNameField(F,T){
			var val = F.value;
			var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;

			if(Npattern.test(val)) {
			return true;
			}else{alert("Please enter valid name for "+T);
			 	return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
				if(ChkMandatoryField(frm.CategoryCode,'CategoryCode')==false) return false;
				if(ChkNameField(frm.CategoryCode,'CategoryCode')==false) return false;
				if(ChkMandatoryField(frm.Amount,'Amount')==false) return false;
				if(ChkNumField(frm.Amount,'Amount')==false) return false;
				if(ChkMandatoryField(frm.Distance,'Distance')==false) return false;
				if(ChkNumField(frm.Distance,'Distance')==false) return false;
				if(ChkMandatoryField(frm.MinDistance,'MinDistance')==false) return false;
				if(ChkNumField(frm.MinDistance,'MinDistance')==false) return false;

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
<H2 align=center>AddNewCategory</H2>
<FORM ACTION="AddNewCategory1.jsp" onsubmit="return validate()">

<CENTER>	

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2">Add NewCategory</TH>
	   </TR>
		
		<TR class=row_odd><td>CategoryCode
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='CategoryCode' value=''>
		</TR>
		
		<TR class=row_even><td>Amount
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='Amount' value=''>
		</TR>
		
		<TR class=row_odd><td>Distance
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='Distance' value=''>in Kms
		</TR>

		<TR class=row_even><td>MinDistance
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='MinDistance' value=''>in Kms
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
