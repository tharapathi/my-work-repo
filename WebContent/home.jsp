<%@ page import="java.sql.*"%>
<jsp>
	<HEAD>
		<TITLE>Secured Netauction-->home</TITLE>
			</HEAD>
	<BODY bgColor="#a3d881" leftMargin="0" topMargin="0" MARGINHEIGHT="0" MARGINWIDTH="0"> <!-- ImageReady Slices (Untitled-1) -->
		
	
		<p align="right">
<TABLE cellSpacing="0" cellPadding="0" width="781" border="0">
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
       
	 &nbsp;&nbsp; &nbsp; &nbsp;

 <TABLE height="632" width="98%" border="0">
  <TBODY>
	<TR>
	<TD vAlign="top" borderColor="#009900" width="25%"  height="432">
  <TABLE height="207" width="99%" border="0">
   <TBODY>
	<TR>
       <TD vAlign="top" 
background="home_files/EIMAGE2.GIF" height="114">
	<P align="center"><FONT color="#ffcc00">
        <STRONG><FONT face="Georgia, Times New Roman, Times, serif" color="#ff0000" size="4"><EM>Buy Now</EM></FONT></STRONG></FONT></P>
			<P align="center"><EM><FONT face="Georgia, Times New Roman, Times, serif" color="#ff0000" size="4"><STRONG>Old Audio &amp; Video C.D.'s</STRONG></FONT></EM></P>
</TD>
</TR>
	<TR>
<TD vAlign="top" height="87"><STRONG>Post Items for Auction</STRONG> Once you register, you can <A href="./sell.jsp">post items for auction</A> any time you want.</TD>
	</TR>
							      </TBODY> 
  </TABLE>


	<P><IMG height="133" src="home_files/OFFER1.GIF" width="204"></P>
	<P align="center"><FONT face="Georgia, Times New Roman, Times, serif" color="#333399"><A href="./help.jsp">  How To Buy &amp; Sell Through <STRONG>NETAUCTION</STRONG> </></FONT></P>
		</TD>
		<TD vAlign="top" width="54%"><p align="right"><FORM name=form1 action="SearchServlet" method=post >
	<STRONG><font color="BLUE"face="arial">SEARCH:</font></STRONG> 
   <input type="text" name="sstring" id="name" size="9">
<SELECT name="category">
       <option selected>Choose Category</option>
<%try
	{
		Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
         Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){%>
	<OPTION><%=rs.getString(1)%></OPTION><%}
		}catch(Exception e) { System.out.println(e); }%>
</SELECT>
	<INPUT type="submit" value="Go">
</FORM></p>
				<H1 align="justify"><FONT size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </FONT>
  </H1>
<BR><BR>
    <BLOCKQUOTE>
		<PRE><STRONG><EM>$ Learn How To <A href="./help.jsp">Buy/Sell</A>
     $ New Items <a href="./NewToday">Today</a>/<a href="./EndToday">Closing</a> Items Today&nbsp;
          $ Search By Catogary </EM></STRONG></PRE>
  </BLOCKQUOTE>
<BR><BR><BR><BR>
						<P><STRONG>Registration</STRONG></P>
  <P align="justify">To bid on or list an item for auction, you must 
  <A href="./registration.jsp"> register</A> first. Registration gives buyers a way to pay you and us a way to contact buyers and sellers. You only need register once, and registration is not 
required to browse  items on the auction floor.


   
  </TD>


  <TD vAlign="top" width="21%">
   <UL>
      <LI>
	<p><A href="./NewToday"><STRONG>New</STRONG> auction items 
	today</A>
      </p>

   <LI>
      <p><A href="./EndToday">Items closing today</A>
      </p>
   </LI>
 </UL>


  <P><A href="./registration.jsp">
  <IMG height="120" src="home_files/ADD3.GIF" width="160" border="0"></A></P>


  <P><IMG height="120" src="home_files/ADD4.GIF" width="160"></P>
  <P>&nbsp;</P>
 </TD>
</TR>


	<TR>
	<TD vAlign="top" height="194">
	<TABLE height="168" width="99%" border="1">
	<TBODY> 								   <TR>
	    <TD vAlign="top" height="137">
            <IMG height="133" src="home_files/AIMAGE2.GIF" width="199"></TD>
	</TR> 
	<TR>	<TD>Just Rs'2000/- 							</TD>
</TR>
</TBODY></TABLE>
</TD>


  <TD vAlign="top">
  <TABLE height="168" width="50%" border="1">
 <TBODY>
  <TR>
  <TD vAlign="top" width="51%" height="137">
  <IMG height="133"src="home_files/EIMAGE4.GIF" width="190"></TD>
<TD vAlign="top" width="49%"><IMG height="133" src="home_files/TIMAGE1.GIF" width="180"></TD>
 </TR>
	<TR>
         <TD height="23">Just Rs'550/-</TD>
          <TD>Just Rs'25000/-</TD>
	</TR>
							</TBODY></TABLE>
	</TD>

   <TD vAlign="top">
   <TABLE height="168" width="86%" border="1">
   	<TBODY>
         <TR>
	  <TD vAlign="top" height="137">
          <IMG height="133" src="home_files/HIMAGE7.GIF" width="156"></TD>
	</TR>
	  <TR>
	  <TD height="23">Just Rs'22000/-</TD>
	</TR>
							</TBODY></TABLE>
					</TD>
				</TR>
			</TBODY></TABLE>
		<HR align="left" width="780">
		<DIV align="center"><STRONG>&nbsp;|</STRONG> <A href="./NewToday">
				New Items</A> <STRONG>|</STRONG> <A href="./EndToday">
				Closing Items</A> <STRONG>|</STRONG> <A href="./sell.jsp">Sell 
				Items</A> <STRONG>|</STRONG></DIV>
	</BODY>
</jsp>
