<%@ page import="java.sql.*,com.web.*"%>
<html>

<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT=0 MARGINWIDTH=0>
<%
   String theuser=request.getParameter("bidder");
%>
<p align=right><TABLE cellSpacing=0 cellPadding=0 width=500 border=0><TBODY><BR><TR><TD align=center><A href='./AfterLogin?theuser=<%=theuser%>'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>My Profile</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Buy.jsp?theuser=<%=theuser%>'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Buy Item</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Sold.jsp?theuser=<%=theuser%>'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Sold Items</STRONG></A></TD><td align=center> | </td><TD align=center>  <A href='./login.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>LogOut</STRONG></A></TD>  </TR><TD></TD>  </TBODY></TABLE></p><br><br><marquee behaviour='ALTERNATE'><B><FONT COLOR='BLUE'><FONT FACE='Comic Sans MS' SIZE='6'>SECURED NETAUCTION</FONT></B></marquee><br>

<%	try
	{
		Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));

		
		Statement st=con.createStatement();
		String bidder=request.getParameter("bidder");
		String pwd=request.getParameter("password");
		String amount=request.getParameter("cardno");
		
		if(amount.length()>0)
		{
		//int amt=Integer.parseInt(amount);
		String id=request.getParameter("id");
		int hbid=Integer.parseInt(request.getParameter("hbid"));
		int min=Integer.parseInt(request.getParameter("min"));
		ResultSet rs=st.executeQuery("select pwd from uinfo_master where uname='"+bidder+"' ");
		if(rs.next())
		{
			String dpwd=rs.getString(1);
			if(!pwd.equals(dpwd))
				out.println("<center><b>invalid Userid or   password</b></center><br><br><center><input type='button' value='Back' onclick='history.back()'");
			else 
			{
                DBS d=new DBS(1,amount); 
				Statement st2=con.createStatement();
				int i=st2.executeUpdate("update bidding_info set status=2 where bamt=(select max(bamt) from bidding_info where itemid="+id+" and bidderid='"+bidder+"')");
				if(i>0)
				{
		ResultSet rs2=st2.executeQuery("select im.itemid,im.catid,im.itemname,im.startprice,im.enddate,im.seller,bi.bidderid,bi.bamt,cm.cat_name from item_master im,bidding_info bi,category_master cm where to_date(im.enddate)<= to_date(sysdate) and cm.catid=im.catid and bi.bidderid='"+bidder+"' and bi.status=2 and bi.itemid="+id);
		/*out.println("<center><table border=3 bordercolor=green>");
		out.println("<thead><th>Item ID</th><Th>Cat. ID</th><Th>Item Name</th><Th>Category Name</th><Th>Start Price</th><Th>End Date</th>");
		out.println("<Th>Seller ID</th><Th>Bidder ID</th><Th>Bid Amount</th></thead>");*/
	/*	while(rs2.next())
		{
		String itemno=rs2.getString(1);
		String catid=rs2.getString(2);
		String itemname=rs2.getString(3);

        String sprice=rs2.getString(4); 
		java.sql.Date edate=rs2.getDate(5);
		String seller=rs2.getString(6);
		bidder=rs2.getString(7);
        String bamt=rs2.getString(8);
		String catname=rs2.getString(9);
		out.println("<tr><td>"+itemno+"</td>");
		out.println("<td>" + catid +"</td>");
		out.println("<td>" + itemname +"</td>");
		out.println("<td>" + catname +"</td>");
		out.println("<td>" + sprice +"</td>");
		out.println("<td>" + edate +"</td>");
		out.println("<td>" + seller +"</td>");
		out.println("<td>" + bidder +"</td>");
		out.println("<td align=center>" + bamt +"</td></tr>");
		}
		out.println("</table></center><br><br>");*/
				Statement stmt=con.createStatement();
						Statement stmt1=con.createStatement();
						//int i=stmt1.executeUpdate("insert into bidding_info values('"+bidder+"',"+amt+","+id+",sysdate) ");
						out.println("<center><b> Rs. "+hbid+" /- is Deducted from your Credit card.<br>Collect Your Item At the following Address</b><br<br></center>");
						rs=stmt.executeQuery("select fname,lname,address,city,state,pin,country,phno,email from uinfo_master where uname='"+request.getParameter("seller")+"'");
						while(rs.next())
				        {%>
                            <center><br> <table><tr><th><u>Address</u></th></tr><tr><td><%=rs.getString(1)%> <%=rs.getString(2)%></td></tr>
							        <tr><td><%=rs.getString(3)%></td></tr>
									<tr><td><%=rs.getString(4)%></td></tr>
									<tr><td><%=rs.getString(5)%></td></tr>
									<tr><td><%=rs.getString(6)%></td></tr>
									<tr><td><%=rs.getString(7)%></td></tr>
									<tr><td><%=rs.getString(8)%></td></tr>
									<tr><td><%=rs.getString(9)%></td></tr></table>
									
				        <%}
				}
			}
								
		}

		}
		out.println("<br><input type='button' value='Print this page' onclick='print()'><br><br><CENTER><STRONG></STRONG>");
		out.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		out.println("<A href=./EndToday>Closing Items</A>");
		out.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		out.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");
		}
		catch(Exception e){e.printStackTrace();}
%>


</body>
</html>