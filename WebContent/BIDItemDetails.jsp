<%@ page import="java.sql.*"%>
<html>
<script language="javascript">
function luhnCheck() {
	
	var cardNumber=document.buy.cardno.value;

                if (isLuhnNum(cardNumber)) {
                    var no_digit = cardNumber.length;
					var oddoeven = no_digit & 1;
					var sum = 0;
                    for (var count = 0; count < no_digit; count++) {
                        var digit = parseInt(cardNumber.charAt(count));
                        if (!((count & 1) ^ oddoeven)) {
                            digit *= 2;
                            if (digit > 9) digit -= 9;
                        };
                        sum += digit;
						
                    };
                    if (sum == 0) return false;
                    if (sum % 10 == 0) return true;
                };
				alert("Enter Valid Credit card Number");
                return false;
            }

            function isLuhnNum(argvalue) {
                argvalue = argvalue.toString();
                if (argvalue.length == 0) {
                    return false;
                }
                for (var n = 0; n < argvalue.length; n++) {
                    if ((argvalue.substring(n, n+1) < "0") ||
                        (argvalue.substring(n,n+1) > "9")) {
                        return false;
                    }
                }
                return true;
            }
</script>
<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT=0 MARGINWIDTH=0>
<%
   String theuser=request.getParameter("theuser");
%>
<p align=right><TABLE cellSpacing=0 cellPadding=0 width=500 border=0><TBODY><BR><TR><TD align=center><A href='./AfterLogin?theuser=<%=theuser%>'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>My Profile</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Buy.jsp?theuser=<%=theuser%>'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Buy Item</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Sold.jsp?theuser=<%=theuser%>'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Sold Items</STRONG></A></TD><td align=center> | </td><TD align=center>  <A href='./login.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>LogOut</STRONG></A></TD>  </TR><TD></TD>  </TBODY></TABLE></p><br><br><marquee behaviour='ALTERNATE'><B><FONT COLOR='BLUE'><FONT FACE='Comic Sans MS' SIZE='6'>SECURED NETAUCTION</FONT></B></marquee><br>
<%
   try
	{
			Class.forName(getServletContext().getInitParameter("driver"));
		Connection con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
		out.println("<h2><center>Item Wise Details</h2>");

		String itid =request.getParameter("id");
		System.out.println(itid);
		Statement stt=con.createStatement();
		ResultSet rss=stt.executeQuery("select itemname from item_master where itemid="+itid);
		rss.next(); 
		String iname=rss.getString(1);
		out.println("<center><font size=+2 face=Arial ><u>"+iname+"</u></font></center><br>");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select bidderid,bamt from bidding_info where itemid="+itid+" and bamt=(select max(bamt) from bidding_info where itemid="+itid+" and status=1)"); 
		String bid="No Bidder Till now";
		int bamt=0;
		if(rs1.next()){
		 bid = rs1.getString(1);
		bamt = rs1.getInt(2);	
		}
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from item_master where itemid="+itid);
		out.println("<center><table border=2>");
		String sp="";
		String minincr="";
		String seller="";
		while(rs.next())
		{
			String desp=rs.getString(4);
			sp=rs.getString(6);
			minincr=rs.getString(7);
			java.sql.Date stdate=rs.getDate(8);
			java.sql.Date edate=rs.getDate(9);
			seller=rs.getString(10);
			String nob=rs.getString(11);
			if (bamt==0)
				bamt=Integer.parseInt(sp);
			out.println("<TR><TD>Start Price</TD><td>" + sp +"</td></tr>");
			out.println("<TR><TD>MinimunIncrement</TD><td>" + minincr +"</td></tr>");
			out.println("<TR><TD>Number Of Bids</TD><td>" + nob +"</td></tr>");
			out.println("<TR><TD>Auction Start Date</TD><td>" + stdate +"</td></tr>");
			out.println("<TR><TD>Auction Ending Date</TD><td>" + edate +"</td></tr>");
			out.println("<TR><TD>Seller</TD><td>" + seller +"</td></tr>");
			out.println("<TR><TD>High Bidder</TD><td>" + bid +"</td></tr>");
			out.println("<tr><td>Current Bid Price</td><td>"+bamt+"</td></tr>");
			out.println("<TR><TD>Description</TD><td>" + desp +"</td></tr>");
		}

		out.println("</table><center>");
		out.println("<P><STRONG>Do you want to buy this item?</STRONG>");
		out.println("<form action=./BuyServlet.jsp name='buy' onsubmit='return luhnCheck()' method='post'> ");
		out.println("<input type=hidden name=id value="+request.getParameter("id"));
		out.println("><input type=hidden name=hbid value="+bamt);
		out.println("><input type=hidden name=seller value="+seller);
		out.println("><input type=hidden name=min value="+minincr);
		out.println("><TABLE><TR><TD>Enter your user id:</TD><TD><INPUT TYPE=\"TEXT\" SIZE=20 NAME=\"bidder\"></TD></TR>");
		out.println("<TR><TD>Enter your password:</TD><TD><INPUT TYPE=PASSWORD SIZE=20 NAME=password></TD>");
		out.println("</TR><TR><TD>Enter your credit Card No:</TD><TD><INPUT TYPE=\"TEXT\" SIZE=60 NAME=\"cardno\"  onBlur=f()></TD></TR></TABLE><br><br><input type=submit value=\"Buy this Item\">&nbsp;&nbsp;<input type=button value=\"Decline\" onclick=javascript:location.href='./ChangeBidder.jsp?theuser="+theuser+"&bamt="+bamt+"&itemid="+itid+"'></form>");

		out.println("<CENTER><STRONG></STRONG>");
		out.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		out.println("<A href=./EndToday>Closing Items</A>");
		out.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		out.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");

		}catch(Exception e){e.printStackTrace();}
%>