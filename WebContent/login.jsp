<%@ page import="java.sql.*"%>
<jsp><HEAD><TITLE>Secured Netauction -->login</TITLE>
  </HEAD>
<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0"><!-- ImageReady Slices (Untitled-1) -->
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
    
  </TBODY></TABLE></p><br><!-- End ImageReady Slices --><!-- End ImageReady Slices -->
  <p align="right">

<FORM name=form1 action="SearchServlet" method=post >
	<STRONG><font color="BLUE"face="arial">SEARCH:</font></STRONG> 
   <input type="text" name="sstring" id="name" size="9">
 
<SELECT  name=category><option>Choose Category</option><%try
	{
		Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
         Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){%>
	<OPTION><%=rs.getString(1)%></OPTION><%}
		}catch(Exception e) { System.out.println(e); }%></SELECT> <INPUT type=submit value=Go > 
</FORM></p>
<br>
<marquee behaviour="ALTERNATE"><B><FONT COLOR="BLUE">
<FONT FACE="Comic Sans MS" SIZE="6">SECURED NETAUCTION</FONT></B>
</marquee>
    <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Verdana, Arial, Helvetica, sans-serif">&nbsp;&nbsp;
<FORM name=form1 action="LoginServlet" method=post>
<font color="#FF9900" face="Georgia, Times New Roman, Times,serif"> <strong>&nbsp;<font color="#FF6600"><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 User ID </font></strong><font color="#FF6600">:</font></font></font> 
      <input name=theuser>
 </P>
 <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font color=#ffffff><strong><font color="#FF6600" face="Georgia,
   Times New Roman, Times, serif">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


Password </font></strong></font><font face="Georgia, Times New Roman, Times, serif"><strong><font color="#FF6600">:</font></strong></font> 
      <input type=password name=password>
    </P>


    <P> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<center>

      <INPUT type=submit value="Log in" name=Submit><br>
	 <!-- <a href="AdminLogin">Adminstrator Login</a> -->
    </P>
  </FORM>
</DIV>
<div id="Layer2" style="position:absolute; left:40px; top:181px; width:168px; height:131px; z-index:2"><a href="./help.jsp"><img src="ADD12.GIF" width="170" height="127" border="0"></a></div>
       

<P><!-- End ImageReady Slices --></P>
<P>&nbsp;</P>
<P> </P>
<PRE>




</PRE>
<HR>

<CENTER>
  <STRONG>|</STRONG> <A 
href="./NewToday">New Items</A> <STRONG>|</STRONG> 
  <A 
href="./EndToday">Closing Items</A> <STRONG>|</STRONG><A href="./sell.jsp">Sell 
  Items</A> <STRONG>|</STRONG> <A 
href="./home.jsp">Home</A> <STRONG>|</STRONG> 
  <CENTER></CENTER></CENTER></BODY></jsp>
