package com.web;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ItemDetails extends HttpServlet 
{
	Connection con;
	PrintWriter pw;

	public void init(ServletConfig sc) throws ServletException
	{
	try
	{
		super.init(sc);
		Class.forName(getServletContext().getInitParameter("driver"));
		con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
	}catch(Exception ce) { ce.printStackTrace();}
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
	try{
		res.setContentType("text/html");
		pw=res.getWriter();

		pw.println("<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT=0 MARGINWIDTH=0><!-- ImageReady Slices (Untitled-1) -->");
		//pw.println("<DIV id=Layer1 style='Z-INDEX: 1; LEFT: 410px; WIDTH: 328px; POSITION: absolute; TOP: 65px; HEIGHT: 35px'>");
		
		pw.println("<p align=right><TABLE cellSpacing=0 cellPadding=0 width=781 border=0><TBODY><BR><TR><TD><A href='./home.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>HOME</STRONG></A> </TD>      <TD>  <A href='./login.jsp'><STRONG> <FONT COLOR='BROWN' FACE='CURLZ MT'>LOGIN</STRONG>  </A></TD>      <TD>    <A href='./registration.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>REGISTER</STRONG></A></TD>    <TD> <A href='./sell.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>SELL</STRONG>      </A></TD>  <TD> <A href='./ForSale.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>CURRENT BID ITEMS</STRONG>      </A></TD> <TD> <A href='./help.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>HELP</STRONG> </A></TD></TR><TD></TD>  </TBODY></TABLE></p><br><br>");
		pw.println("<p align=right><FORM name=form1 action='./SearchServlet'  method=post >Search:<INPUT name=sstring> ");
		pw.println("<SELECT  name=category > <option >Choose Category</option>");
		try
		{
		Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){
		pw.println("<OPTION>"+rs.getString(1)+"</OPTION>");}
		}
		catch(Exception e){}
		pw.println("</SELECT> <INPUT type=submit value=Go > ");
		pw.println("</FORM></p><!-- End ImageReady Slices -->");		pw.println("<h2><center>Item Wise Details</h2>");

		String itid =req.getParameter("id");
		System.out.println(itid);
		Statement stt=con.createStatement();
		ResultSet rss=stt.executeQuery("select itemname from item_master where itemid="+itid);//+" and enddate >= sysdate");
		rss.next(); 
		String iname=rss.getString(1);
		pw.println("<center><font size=+2 face=Arial ><u>"+iname+"</u></font></center><br>");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select bidderid,bamt from bidding_info where itemid="+itid+" and bamt=(select max(bamt) from bidding_info where itemid="+itid+")"); 
		String bid="No Bidder Till now";
		int bamt=0;
		if(rs1.next()){
		 bid = rs1.getString(1);
		bamt = rs1.getInt(2);	
		}
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from item_master where itemid="+itid);
		pw.println("<center><table border=2>");
		String sp="";
		String minincr="";
		while(rs.next())
		{
			String desp=rs.getString(4);
			sp=rs.getString(6);
			minincr=rs.getString(7);
			java.sql.Date stdate=rs.getDate(8);
			java.sql.Date edate=rs.getDate(9);
			String seller=rs.getString(10);
			String nob=rs.getString(11);
			if (bamt==0)
				bamt=Integer.parseInt(sp);
			pw.println("<TR><TD>Start Price</TD><td>" + sp +"</td></tr>");
			pw.println("<TR><TD>MinimunIncrement</TD><td>" + minincr +"</td></tr>");
			pw.println("<TR><TD>Number Of Bids</TD><td>" + nob +"</td></tr>");
			pw.println("<TR><TD>Auction Start Date</TD><td>" + stdate +"</td></tr>");
			pw.println("<TR><TD>Auction Ending Date</TD><td>" + edate +"</td></tr>");
			pw.println("<TR><TD>Seller</TD><td>" + seller +"</td></tr>");
			pw.println("<TR><TD>High Bidder</TD><td>" + bid +"</td></tr>");
			pw.println("<tr><td>Current Bid Price</td><td>"+bamt+"</td></tr>");
			pw.println("<TR><TD>Description</TD><td>" + desp +"</td></tr>");
		}

		pw.println("</table><center>");
		pw.println("<P><STRONG>Do you want to bid on this item?</STRONG>");
		pw.println("<form action=./AuctionServlet>");
		pw.println("<input type=hidden name=id value="+req.getParameter("id"));
		pw.println("><input type=hidden name=hbid value="+bamt);
		pw.println("><input type=hidden name=min value="+minincr);
		pw.println("><TABLE><TR><TD>Enter your user id:</TD><TD><INPUT TYPE=\"TEXT\" SIZE=20 NAME=\"bidder\"></TD></TR>");
		pw.println("<TR><TD>Enter your password:</TD><TD><INPUT TYPE=PASSWORD SIZE=20 NAME=password></TD>");
		pw.println("</TR><TR><TD>Your Bid Amount:</TD><TD><INPUT TYPE=\"TEXT\" SIZE=60 NAME=\"amount\"  onBlur=f()></TD></TR></TABLE><br><br><input type=submit value=\"Bid for Item\"></form>");

		pw.println("<CENTER><STRONG></STRONG>");
		pw.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		pw.println("<A href=./EndToday>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");

		}catch(Exception e){e.printStackTrace();}
	}
}