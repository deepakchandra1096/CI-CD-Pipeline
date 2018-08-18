
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
 <% String uid = request.getParameter("uid");%>
<HTML>

<head>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</head>

<body  CLASS=Grad onload="document.LOGIN.uid.focus();">
<center>
<BR><BR>
<FONT FACE="Century Gothic">


<!--Declaration of varaibles-->

<%! String errormsg ;%>
<%! String disluserid ;%>
<%! String dislpwd ;%>

    

<% 
   /*Retreiving user id and password*/

    disluserid = request.getParameter("uid");
    if(disluserid == null)
    disluserid = "";
    dislpwd = request.getParameter("pwd");
    if(dislpwd == null)
    dislpwd = "";

%>

<!--Retrieve the error from request and display on screen-->

<%  errormsg = request.getParameter("error") ;
    //System.out.println("errormsg = "+errormsg);
    if (errormsg == null)
    {
        //System.out.println("Error messages was null so clearing it..");
        errormsg = " ";
    }
    if(errormsg.equals("blankfields"))
    {
      %>
       <FONT COLOR="#FF0000">
       Both the fields are Mandatory.Please fill up both fields.<BR><BR>
      <%
    }  
    if(errormsg.equals("invalid"))
    {
      %>
        <FONT COLOR="#FF0000">
        Invalid Username or Password. Please re-enter. <BR><BR>
        <%
    } 
%>

<%-- ***** LOGIN SCREEN ***** --%>


<FORM NAME="LOGIN" ACTION="Validate.jsp" METHOD="POST" >

<h2 align=center>Enter Your UserID and Password to Login</h2>

<TABLE class="notepad" align=center width="30%">
<TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> LOGIN FORM </TH>
		</TR>
<TR>
	<TD class=row_even align=center ><B>User Id</B></TD>
	<TD class=row_even><input TYPE="text" id = "usr" name="uid" size="10" maxlength="8" value="<%=uid%>"> 
</TR>
<TR>
	<TD class=row_even align=center><B>Password</B></TD>
	<TD  class=row_even><input TYPE="password" name="pwd" size="10"  maxlength="8">

</TR>
<TR>
	<TD class=row_even align=center ><INPUT class= "Button" TYPE=submit name=submit value="Login">
</TD>
	<TD class=row_even align=center><INPUT class= "Button"  TYPE=reset name=resett value="Reset" > </TD></TD>
</TD>
</TR>
</TABLE>
</center>

</FORM>
</BODY>
</HTML>
