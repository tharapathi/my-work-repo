<%@ page import="java.sql.*"%>
<jsp><HEAD><TITLE>Secured Netauction--> help</TITLE>

</HEAD>
<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0">
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

<HR><p align="right">
<FORM name=form1 action="SearchServlet" method=post >
<strong>
<font color="blue"face="arial">SEARCH:</font> </strong>
   <input type="text" name="sstring" id="name" size="10"> 
<SELECT  name=category id="category"><option>Choose Category</option><%try
	{
		Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
         Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){%>
	<OPTION><%=rs.getString(1)%></OPTION><%}
		}catch(Exception e) { System.out.println(e); }%></SELECT> <INPUT type=submit value=Go > 
</FORM>  </p>        <td height="64" align="center">                     </td>
        </tr>
        <tr>
          <td height="193" valign="top">&nbsp; </td>
        </tr>

        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    <td width="78%"><TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
        <TBODY>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD bgColor=#009966><FONT class=bobe-default-font><B>New ?</B></FONT></TD>
          </TR>
          <TR> 
            <TD><FONT class=bobe-default-font>Welcome to Sucured Netauction, As a seller  at Netauction, you can convert your items into cash and as a buyer;  you can find items at prices you want. Let these pages guide you  so that you too can experience the <B>Thrill of Auctions</B>.</FONT><BR> 
              <BR> <FONT 
      class=bobe-big-font><B>Take this quick tour:</B></FONT><BR 
      clear=all> <BR> <FONT class=bobe-default-font><B><A 
      href="#join">How to join?</A> | <A 
      href="#buy">How to buy?</A> | <A 
      href="#sell">How to sell?</A></B></FONT></TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD bgColor=#009966><FONT class=bobe-default-font><B>What is an auction?</B></FONT></TD>
          </TR>
          <TR> 
            <TD><FONT class=bobe-default-font>An auction is a public sale in which 
              the price is determined by bidding, and the item is sold to the 
              highest bidder. To participate in an auction means to bid to obtain 
              an item. The person who offers the highest bid wins the right to 
              purchase the item at that price. <BR>
              <BR>
              <B>Some terms you will encounter: </B><BR>
              · <B><I>Bid</I></B>, a bid is the offer of a specific amount of 
              money on an item for sale. The bidder competes with other potential 
              buyers, keeping in mind that the buyer with the highest bid is obliged 
              to complete the purchase with the seller. Hence, a bid is the price 
              you, the bidder, are willing to pay for an item up for auction. 
              <BR>
              <BR>
              · <B><I>Win</I></B>, the person with the high bid is the winner 
              of the auction. If you win an auction by placing the winning bid, 
              you can then purchase the item at your winning bid amount.<BR>
              </FONT> </TD>
          </TR>
          <TR> 
            <TD>&nbsp;</TD>
          </TR>
          <TR> 
            <TD bgColor=#009966><A name=join><FONT class=bobe-default-font><B>Register 
              for a Password and User name </B></FONT></A></TD>
          </TR>
          <TR> 
            <TD><FONT class=bobe-default-font>Before you can participate in           an   auction  you must first <B><A 
      href=".//registration.jsp">register</A></B> and choose 
              a User name. Once you register, you can buy, sell and you are also 
              eligible for our give aways every week. <BR>
              <BR>
              Please record your User name and Password and keep them in a safe 
              place. You will need to enter this User name every time you use 
              the site. </FONT></TD>
          </TR>
          <TR> 
            <TD align="right"><font color="#0000FF"><strong><a href="#top"><em>Top</em></a></strong></font></TD>
          </TR>
          				
		
                <TR> 
            <TD bgColor=#009966><FONT class=bobe-default-font><A 
      name=bid></A></FONT><A name=buy><FONT class=bobe-default-font><B>How to 
              buy?</B></FONT></A></TD>
          </TR>
          <TR> 
            <TD vAlign=top><FONT class=bobe-default-font>There are three ways 
              to buy an item on Netaucs; using Auctions, Quick!Buy and Classifieds: 
              <BR>
              <BR>
              <B>Buying using Auctions:</B> An auction is a public sale in which 
              the seller specifies the minimum amount for an item. You can mention 
              the price at which they want to buy the item. At the end of the 
              auction, the item is sold to the highest bidder. <BR>
              <BR>
              <B>Buying at Quick!Buy:</B> In a Quick!Buy, a Seller sells an item 
              (single or multiple quantity) for sale at a fixed price. As a Buyer 
              you can simply 'Buy' the Item immediately. One or many buyers can 
              buy it at that price.<BR>
              </FONT></TD>
          </TR>
          <TR> 
            <TD align="right"><font color="#0000FF"><strong><a href="#top"><em>Top</em></a></strong></font></TD>
          </TR>
          <TR> 
            <TD bgColor=#009966><A name=sell><FONT class=bobe-default-font><B>How 
              to Sell?</B></FONT></A></TD>
          </TR>
          <TR> 
            <TD><FONT class=bobe-default-font>You can sell your item on Netaucs 
              using Auctions as well as Quick!Buy. <BR>
              <BR>
              <B>Selling using an Auction: </B>An auction is a public sale in 
              which you as a seller can specify the minimum amount for an item. 
              The buyers will bid for the item for a duration specified by you. 
              This duration can be from 1 hour to 7 days. At the end of the auction, 
              the item is sold to the highest bidder. <BR>
              <BR>
              <B>Note:</B> You have to be a registered user of SecuredNetauction to sell on Secured Netauction. If you haven't registered yet, <A  href=".//registration.jsp"><B>do so now</B></A></FONT><BR>
              <BR>
              </A></FONT></TD>
          </TR>
        </TBODY>
      </TABLE></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td align="right"><font color="#0000FF"><strong><a href="#top"><em>Top</em></a></strong></font></td>
  </tr>
</table>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>

<HR>
<CENTER>
  <p><STRONG>|</STRONG> <A 
href="./NewToday">New Items</A> <STRONG>|</STRONG> 
    <A 
href="./EndToday">Closing Items</A> <STRONG>|</STRONG> 
    <A href="./sell.jsp">Sell Items</A> <STRONG>|</STRONG> 
    <A 
href="./home.jsp">Home</A> <STRONG>|</STRONG></p>
  <p>&nbsp;</p>
</CENTER>
</BODY></jsp>
