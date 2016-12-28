<%@ page import="java.sql.*"%> 
<jsp><HEAD>
<TITLE>Secured Netauction --> Registration</TITLE>
</HEAD>
<BODY bgColor="#a3d88" leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0">  <!-- ImageReady Slices (Untitled-1) -->
<p align="right">
<TABLE cellSpacing=0 cellPadding=0 width=780 border=0>
  <TBODY>

<BR>
   <TR>
    <TD>
     <A href="./home.jsp"><STRONG>
          <FONT COLOR="BROWN" FACE="CURLZ MT">HOME</STRONG>
     </A> </TD>    
    <TD>
    <A href="./login.jsp"><STRONG> 
         <FONT COLOR="BROWN" FACE="CURLZ MT">LOGIN</STRONG>
     </A></TD>
        <TD>
    <A href="./registration.jsp"><STRONG>
        <FONT COLOR="BROWN" FACE="CURLZ MT">REGISTER</STRONG>
     </A></TD>
        <TD>
      <A href="./sell.jsp"><STRONG>
        <FONT COLOR="BROWN" FACE="CURLZ MT">SELL</STRONG>
       </A></TD>
	    <TD>
      <A href="./ForSale.jsp"><STRONG>
        <FONT COLOR="BROWN" FACE="CURLZ MT">CURRENT BID ITEMS</STRONG>
       </A></TD>
        <TD>
     <A href="./help.jsp"><STRONG>
        <FONT COLOR="BROWN" FACE="CURLZ MT">HELP</STRONG>
    </A></TD>
          
  </TR>
    <TD></TD>
    
  </TBODY></TABLE></p><!-- End ImageReady Slices --><!-- End ImageReady Slices -->
<p align="right">
<FORM name=form1 action="SearchServlet" method=post >
<tr>
         <td width ="10%">
        <font color="BLUE"face="arial"><STRONG> SEARCH:</STRONG></font><td width="50%"><input type="text" name="sstring" id="name" size="10"> 
       </td>
    </tr> 
<SELECT  name=category><option>Choose Category</option> 
<%try
	{
		Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
         Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){%>
	<OPTION><%=rs.getString(1)%></OPTION><%}
		}catch(Exception e) { System.out.println(e); }%>
</SELECT> <INPUT type=submit value=Go > 
</FORM></p><BR>

<marquee behaviour="ALTERNATE"><B><FONT COLOR="BLUE">
<FONT FACE="Comic Sans MS" SIZE="6">SECURED NETAUCTION</FONT></B>
</marquee>
<!-- End ImageReady Slices -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size="5" 
  face="Times New Roman, Times, serif"><STRONG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<center><TABLE>
<TBODY>
<TR> 
    <TD bgColor=#009966 align="center"><FONT SIZE=18>Registration  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</TD></TR></TBODY></TABLE></STRONG></FONT></p>
<BLOCKQUOTE>
<FORM action="RegistrationServlet" method=post>
  <P align=center><B><FONT face=Arial color=#cc0000 size=4>Step One<FONT 
  color=#003399 size=3> - </FONT></FONT><FONT face=Arial color=#003399 
  size=3>Your information </FONT></B>
<center>
  <TABLE borderColor=#cccc99 cellSpacing=0 cellPadding=0 width=500 border=1>
    <TBODY>
    <TR>
      <TD>
        <TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
          <TBODY>
          <TR>
            <TD vAlign=top align=right width="39%" bgColor=#bae39a>
              <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR bgColor=#bae39a>
                  <TD align=right colSpan=2><FONT face=Arial size=2><B>Login 
                    ID:</B></FONT> </TD></TR>
                <TR>
                  <TD align=right width="49%" bgColor=#bae39a><FONT 
                    face=Arial><FONT face=Arial size=1></FONT></FONT></TD>
                  <TD align=right width="51%">&nbsp;</TD></TR></TBODY></TABLE></TD>
            <TD vAlign=top noWrap width="61%"><FONT size=2><INPUT name=uname 
              size=30 maxLength=20> </FONT><FONT face=Arial color=#cc0000 
              size=2><B>*</B><BR></FONT><FONT face=Arial size=1>Not case 
              sensitive, 5 characters minimum, 20 maximum<BR></FONT></TD></TR>
          <TR vAlign=top>
            <TD vAlign=top align=right width="39%" bgColor=#bae39a><B><FONT 
              face=Arial size=2>Password:</FONT></B></TD>
            <TD vAlign=top width="61%"><FONT size=2><INPUT type=password 
              maxLength=30 size=30 name=password> </FONT><B><FONT face=Arial 
              color=#cc0000 size=2>*</FONT></B><BR><FONT face=Arial 
              size=1>Please include one numeric character.<BR>5 character 
              minimum. Can not contain "Login".<BR></FONT></TD></TR>
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>Verify Password:</FONT> </B></TD>
            <TD width="61%"><FONT size=2><INPUT type=password maxLength=30 
              size=30 name=verpwd> </FONT><B><FONT face=Arial color=#cc0000 
              size=2>*</FONT></B></TD></TR>
          <TR>
            <TD vAlign=top align=right width="39%" bgColor=#bae39a><B><FONT 
              face=Arial size=2>Primary Email Address:</FONT> </B></TD>
            <TD vAlign=top width="61%"><FONT size=2><INPUT name=email 
              size=30 maxLength=50> </FONT><B><FONT face=Arial color=#cc0000 
              size=2>*</FONT></B><BR><FONT face=Arial size=1>Address of all your 
              correspondence.</FONT><BR></TD></TR>
          
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>First Name: </FONT></B></TD>
            <TD><FONT size=2><INPUT name=fname size=30 maxLength=14> 
              </FONT><B><FONT face=Arial color=#cc0000 size=2>*</FONT></B>&nbsp; 
              &nbsp; </TD></TR>
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>Last Name:</FONT></B></TD>
            <TD width="61%"><FONT size=2><INPUT maxLength=14 size=30 
              name=lname> </FONT><B><FONT face=Arial color=#cc0000 
              size=2>*</FONT></B></TD></TR>
          <TR vAlign=top>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2><B>Phone Number:</B></FONT></B> </TD>
            <TD noWrap width="61%"><FONT size=2><INPUT maxLength=10 size=10 
              name=phno> </FONT><B><FONT color=#cc0000>*</FONT><FONT face=Arial 
              size=1><BR>Just Numbers, No dashes</FONT><FONT 
              color=#cc0000></FONT><B><FONT color=#cc0000> 
          </FONT></B></B></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><BR><B><FONT 
  face=Arial color=#cc0000 size=4>Step Two<FONT color=#003399 size=3> - 
  </FONT></FONT><FONT face=Arial color=#003399 size=3>Address Information 
  </FONT></B>
<center>
  <TABLE borderColor=#cccc99 cellSpacing=0 cellPadding=0 width=500 border=1>
    <TBODY>
    <TR>
      <TD>
        <TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
          <TBODY>
          <TR>
            <TD bgColor=#bae39a colSpan=2>
              <DIV><FONT face=Arial color=#000000 size=2><B><FONT 
              color=#003399>Address Information:</FONT> 
              </B><SMALL></SMALL></FONT></DIV></TD></TR>
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>House No:</FONT></B></TD>
            <TD noWrap width="61%"><FONT size=2><INPUT maxLength=30 size=30 
              name=hno> </FONT><B><FONT color=#cc0000>*</FONT></B><BR></TD></TR>
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>Street No:</FONT></B></TD>
            <TD width="61%"><FONT size=2><INPUT maxLength=30 size=30 
              name=stno><FONT size=1><BR>Please enter full street 
              address.</FONT> </FONT></TD></TR>
          <TR height=45>
            <TD vAlign=top align=right width="39%" bgColor=#bae39a><B><FONT 
              face=Arial size=2>City:</FONT></B></TD>
            <TD noWrap width="61%"><FONT size=2><INPUT maxLength=30 size=30 
              name=city> </FONT><B><FONT color=#cc0000>*</FONT></B><BR><FONT 
              size=1>Full spelling, no punctuation or numbers.</FONT></TD></TR>
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>State:</FONT></B></TD>
            <TD noWrap><FONT size=2><SELECT size=1 name=state> <OPTION 
                selected>A.P</OPTION> <OPTION>T.M</OPTION> 
                <OPTION>K.A</OPTION> <OPTION>KL</OPTION> <OPTION>B.H</OPTION> 
                <OPTION>AZ</OPTION> <OPTION>AR</OPTION> <OPTION>CA</OPTION> 
                <OPTION>CO</OPTION> <OPTION>CT</OPTION> <OPTION>DE</OPTION> 
                <OPTION>DC</OPTION> <OPTION>FL</OPTION> <OPTION>GA</OPTION> 
                <OPTION>HI</OPTION> <OPTION>ID</OPTION> <OPTION>IL</OPTION> 
                <OPTION>IN</OPTION> <OPTION>IA</OPTION> <OPTION>KS</OPTION> 
                <OPTION>KY</OPTION> <OPTION>LA</OPTION> <OPTION>ME</OPTION> 
                <OPTION>MD</OPTION> <OPTION>MA</OPTION> <OPTION>MI</OPTION> 
                <OPTION>MN</OPTION> <OPTION>MS</OPTION> <OPTION>MO</OPTION> 
                <OPTION>MT</OPTION> <OPTION>NE</OPTION> <OPTION>NV</OPTION> 
                <OPTION>NH</OPTION> <OPTION>NJ</OPTION> <OPTION>NM</OPTION> 
                <OPTION>NY</OPTION> <OPTION>NC</OPTION> <OPTION>ND</OPTION> 
                <OPTION>OH</OPTION> <OPTION>OK</OPTION> <OPTION>OR</OPTION> 
                <OPTION>PA</OPTION> <OPTION>RI</OPTION> <OPTION>SC</OPTION> 
                <OPTION>SD</OPTION> <OPTION>TN</OPTION> <OPTION>TX</OPTION> 
                <OPTION>UT</OPTION> <OPTION>VT</OPTION> <OPTION>VA</OPTION> 
                <OPTION>WA</OPTION> <OPTION>WV</OPTION> <OPTION>WI</OPTION> 
                <OPTION>WY</OPTION></SELECT> </FONT><FONT 
              color=#cc0000><B>*</B></FONT></TD></TR>
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>Country:</FONT></B></TD>
            <TD width="61%"><FONT face=Arial><FONT size=2><SELECT size=1 
              name=country> <OPTION selected>India</OPTION> 
                <OPTION>Australia</OPTION> <OPTION>bangladesh</OPTION> <OPTION>pakistan</OPTION> 
                <OPTION>japan</OPTION> <OPTION>newzland</OPTION> <OPTION>AR</OPTION> 
                <OPTION>CA</OPTION> <OPTION>CO</OPTION> <OPTION>CT</OPTION> 
                <OPTION>DE</OPTION> <OPTION>DC</OPTION> <OPTION>FL</OPTION> 
                <OPTION>GA</OPTION> <OPTION>HI</OPTION> <OPTION>ID</OPTION> 
                <OPTION>IL</OPTION> <OPTION>IN</OPTION> <OPTION>IA</OPTION> 
                <OPTION>KS</OPTION> <OPTION>KY</OPTION> <OPTION>LA</OPTION> 
                <OPTION>ME</OPTION> <OPTION>MD</OPTION> <OPTION>MA</OPTION> 
                <OPTION>MI</OPTION> <OPTION>MN</OPTION> <OPTION>MS</OPTION> 
                <OPTION>MO</OPTION> <OPTION>MT</OPTION> <OPTION>NE</OPTION> 
                <OPTION>NV</OPTION> <OPTION>NH</OPTION> <OPTION>NJ</OPTION> 
                <OPTION>NM</OPTION> <OPTION>NY</OPTION> <OPTION>NC</OPTION> 
                <OPTION>ND</OPTION> <OPTION>OH</OPTION> <OPTION>OK</OPTION> 
                <OPTION>OR</OPTION> <OPTION>PA</OPTION> <OPTION>RI</OPTION> 
                <OPTION>SC</OPTION> <OPTION>SD</OPTION> <OPTION>TN</OPTION> 
                <OPTION>TX</OPTION> <OPTION>UT</OPTION> <OPTION>VT</OPTION> 
                <OPTION>VA</OPTION> <OPTION>WA</OPTION> <OPTION>WV</OPTION> 
                <OPTION>WI</OPTION> <OPTION>WY</OPTION></SELECT> </FONT><FONT 
              color=#cc0000 size=1><B>*</B></FONT></FONT></TD></TR>
          <TR>
            <TD align=right width="39%" bgColor=#bae39a><B><FONT face=Arial 
              size=2>&nbsp;Zip:</FONT></B></TD>
            <TD width="61%"><FONT face=Arial><INPUT maxLength=6 size=15 
              name=pin> </FONT></TD></TR>
          <TR>
            <TD bgColor=#bae39a></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</center><BR>
<center>
  <TABLE borderColor=#cccc99 height=37 cellSpacing=0 cellPadding=0 width=268 
  border=1>
    <TBODY>
    <TR>
      <TD><INPUT onFocus=MM_validateForm('uname','','R','email','','RisEmail','fname','','R','phno','','RisNum','hno','','R','city','','R','uname','','R','password','','R','verpwd','','R','email','','RisEmail','fname','','R','phno','','RisNum','hno','','R','city','','R');NoPopup();return document.MM_returnValue type=submit value="COMPLETE MY REGISTRATION" name=submitRegistration> 
      </TD></TR></TBODY></TABLE></center>
  <P align=center></FORM><PRE>

</PRE>
  <HR>

  <CENTER>
    <STRONG>|</STRONG> <A 
  href="./NewToday">New Items</A> <STRONG>|</STRONG> 
    <A 
  href="./EndToday">Closing Items</A> <STRONG>|</STRONG> 
    <A 
  href="./sell.jsp">Sell Items</A> <STRONG>|</STRONG> <A 
  href="./home.jsp">Home</A> <STRONG>|</STRONG> 
  </CENTER></BLOCKQUOTE></BODY></jsp>
