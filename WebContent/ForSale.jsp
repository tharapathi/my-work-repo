<%@ page import="java.sql.*"%> 
<jsp><HEAD>
<TITLE>Secured Netauction --> Registration</TITLE>
<meta http-equiv="refresh" content=4>
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
		%>
</SELECT> <INPUT type=submit value=Go > 
</FORM></p><BR>
<center>

<FONT FACE="Comic Sans MS" SIZE="6">SECURED NETAUCTION</FONT></B>

<FONT size="5" 
  face="Times New Roman, Times, serif"><STRONG>
<center><TABLE>
<TBODY>
<TR> 
    <TD bgColor=#009966 align="center"><FONT size=6><STRONG>BID STATUS  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</TD></TR></TBODY></TABLE></STRONG></p>
<BLOCKQUOTE>
<FORM action="RegistrationServlet" method=post>
  
<center>
      <%
	  
	    ResultSet rs2=st.executeQuery("select im.itemid,im.catid,im.itemname,im.startprice,im.enddate,im.seller,bi.bidderid,bi.bamt from item_master im,bidding_info bi where im.enddate >= current_date and bi.status=1 and im.itemid=bi.itemid order by itemid");
		
		out.println("<center><table border=3 bordercolor=green>");
		out.println("<thead><th>Item ID</th><Th>Cat. ID</th><Th>Item Name</th><Th>Start Price</th><Th>End Date</th>");
		out.println("<Th>Seller ID</th><Th>Bidder ID</th><Th>Bid Amount</th></thead>");
		while(rs2.next())
		{
		String itemno=rs2.getString(1);
		String catid=rs2.getString(2);
		String itemname=rs2.getString(3);
        String sprice=rs2.getString(4); 
		java.sql.Date edate=rs2.getDate(5);
		String seller=rs2.getString(6);
		String bidder=rs2.getString(7);
        String bamt=rs2.getString(8);
		out.println("<tr><td><a href='./ItemDetails?id="+itemno+"'>"+itemno+"</a></td>");
		out.println("<td>" + catid +"</td>");
		out.println("<td>" + itemname +"</td>");
		out.println("<td>" + sprice +"</td>");
		out.println("<td>" + edate +"</td>");
		out.println("<td>" + seller +"</td>");
		out.println("<td>" + bidder +"</td>");
		out.println("<td align=center>" + bamt +"</td></tr>");
		}
		out.println("</table></center><br><br>");
	  }catch(Exception e) { System.out.println(e); }%>
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
