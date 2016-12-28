<%@ page import="java.sql.*"%>
<jsp><HEAD><TITLE>Secured Netauction --> Post Items</TITLE>
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
     <A href="./help.jsp"><STRONG>
        <FONT COLOR="BROWN" FACE="CURLZ MT">HELP</STRONG>
    </A></TD>
          
  </TR>
    <TD></TD>
    
  </TBODY></TABLE></p><!-- End ImageReady Slices --><!-- End ImageReady Slices -->

<p align="right">
<FORM name=form1 action="SearchServlet" method=post >
	<STRONG><font color="BLUE"face="arial">SEARCH:</font></STRONG> 
   <input type="text" name="sstring" id="name" size="9">
<SELECT name="category"><option selected>Choose Category</option>
<%try
	{
		Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
         Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){%>
	<OPTION><%=rs.getString(1)%></OPTION><%}
		}catch(Exception e) { System.out.println(e); }%></SELECT> <INPUT type=submit value=Go > </form></p>
<!-- End ImageReady Slices -->
<br>
<marquee behaviour="ALTERNATE"><B><FONT COLOR="BLUE">
<FONT FACE="Comic Sans MS" SIZE="6">SECURED NETAUCTION</FONT></B>
</marquee>
<br>
<H3><center>Post Item For Auction</H3>

<DIV id=Layer2 
style="Z-INDEX: 2; LEFT: 15px; WIDTH: 193px; POSITION: absolute; TOP: 224px; HEIGHT: 145px"><a href="./registration.jsp"><IMG src="sell_files/ADD3.GIF" width=190 
height=142 border="0"></a></DIV>
<P>&nbsp; 
<FORM name=form1 action="SellServlet" method=post>
<TABLE height=414 width=756 align=center><INPUT type=hidden value="insert" name="action"> 
  <TBODY>
  <TR>
    <TD vAlign=center width=202>&nbsp;</TD>
    <TD vAlign=center align=right width=185><STRONG>Enter your user 
      id:</STRONG></TD>
    <TD vAlign=center width=353><INPUT name=seller></TD></TR>
  <TR>
    <TD vAlign=center>&nbsp;</TD>
    <TD vAlign=center align=right><STRONG>Enter your password:</STRONG></TD>
    <TD vAlign=center><INPUT type=password name=password></TD></TR>
  <TR>
    <TD vAlign=center height=21>&nbsp;</TD>
    <TD vAlign=center align=right><STRONG>Item Name:</STRONG></TD>
    <TD vAlign=center><INPUT id=itemname name=itemname></TD></TR>
  <TR>
    <TD vAlign=center height=31>&nbsp;</TD>
    <TD vAlign=top align=right><STRONG>Category:</STRONG></TD>
    <TD vAlign=top><SELECT id=category size=1 name=category>
            <option>Choose Category</option>
            <%try
	{
		Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
         Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){%>
	<OPTION><%=rs.getString(1)%></OPTION><%}
		}catch(Exception e) { System.out.println(e); }%>
          </SELECT></TD></TR>
  <TR>
    <TD vAlign=top>&nbsp;</TD>
    <TD vAlign=top align=right><STRONG>Summary:</STRONG></TD>
    <TD vAlign=center><INPUT size=40 name=summary></TD></TR>
  <TR>
    <TD vAlign=top>&nbsp;</TD>
    <TD vAlign=center align=right><STRONG>Initial starting price:	 
     </STRONG></TD>
    <TD vAlign=center><INPUT size=10 name=startprice></TD></TR>
  <TR>
    <TD vAlign=top>&nbsp;</TD>
    <TD vAlign=center align=right><STRONG>Increment Price:</STRONG></TD>
    <TD vAlign=center><INPUT id=incrprice size=10 name=incrprice></TD></TR>

<TR>
        <TD vAlign=top><img src=" registration_files\ADD11.jpg" width="190" height="122"></TD>    
    <TD vAlign=top align=right><STRONG>Description of item:</STRONG></TD>
    <TD vAlign=center><TEXTAREA name=description rows=8 cols=40></TEXTAREA></TD></TR>
  <TR>
    <TD vAlign=top>&nbsp;</TD>
    <TD vAlign=center align=right><STRONG>Duration:</STRONG></TD>
    <TD vAlign=center><SELECT size=1 name=auctiondays> <OPTION 
        value=3>3</OPTION> <OPTION value=5>5</OPTION> <OPTION value=7 
        selected>7</OPTION></SELECT></TD></TR>
  <TR>
    <TD vAlign=top>&nbsp;</TD>
    <TD vAlign=center align=right>&nbsp;</TD>
    <TD vAlign=center align=middle><INPUT name=Submit type=submit onFocus="MM_validateForm('seller','','R','itemname','','R','summary','','R','startprice','','RisNum','incrprice','','RisNum','description','','R','seller','','R','password','','R','itemname','','R','summary','','R','startprice','','RisNum','incrprice','','RisNum');return document.MM_returnValue" value="Post Item"></TD></TR></TBODY></TABLE>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

<P>&nbsp; </FORM>
<HR>

<CENTER>
  <STRONG>|</STRONG> <A 
href="./NewToday">New Items</A> <STRONG>|</STRONG> 
  <A 
href="./EndToday">Closing Items</A><STRONG> |</STRONG> 
  <A 
href="./sell.jsp">Sell Items</A> <STRONG>|</STRONG> <A 
href="./home.jsp">Home</A> <STRONG>|</STRONG> 
  <CENTER></CENTER></CENTER>
<H3>&nbsp;</H3>
<H3> </H3>
<CENTER></CENTER>
<BLOCKQUOTE>
  <H3> </H3>
  <CENTER></CENTER></BLOCKQUOTE></BODY></jsp>
