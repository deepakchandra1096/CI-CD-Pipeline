<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<script LANGUAGE="Javascript">
<!--
function fnShowDetails()
			{
				var frm = document.forms(0);
				var CategoryID = frm.CategoryID.value;
				
				if (CategoryID=='')
				{
					alert("Please select CategoryID to Proceed");
				}else{
					var URL = "ShowCategories01.jsp?CategoryID="+CategoryID;
					fnEmpPopUp(URL,300,400);
				}
			}
	function validate()
		{
			var frm = document.forms(0);
			var CategoryID = frm.CategoryID.value;

			if (CategoryID=='')
				{
					alert("Please select CategoryID to Proceed");
				}
				

		}
//-->

</script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<BODY class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=0){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<h2 align=center>Cancel Category</h2>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String Condition = "CategoryID";
	String[] ConValues = new String[2000];
	int ConCount=0,i=0;
	String Query1="";
%>
<FORM Name='DelForm' METHOD=POST ACTION="DeleteCategory1.jsp" onsubmit="return validate()">
		 <center>
   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	<TR class=row_title ALIGN="center"> <TH COLSPAN="2"> Cancel Category</TH>
		<TR class=row_even>
			<TH><%=Condition.replace('`',' ')%></TH>
			<TD><SELECT NAME="<%=Condition%>">
			<OPTION Value="">Select</OPTION>

<%
	try{
			
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();

			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from categorymaster";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+" from categorymaster";
			}
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					ConValues[i]=x;
					%><OPTION Value=<%=ConValues[i]%>><%=ConValues[i]%></OPTION><%
					i++;
				}
		}catch(Exception e){%><%=e%><%}
%>
		</SELECT></TD>
		</TR>
		<TR class =row_even><TD align=center><Input type='Submit' name='submit' value='Delete'></TD>
		<TD align=center><input type="button" ID='Item' value="ShowDetails" onclick="fnShowDetails()"></TD>
		</TR>
		</TABLE>
</FORM>
</BODY>

<%
}
%>