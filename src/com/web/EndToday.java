package com.web;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class EndToday extends HttpServlet 
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
		
		pw.println("<p align=right><TABLE cellSpacing=0 cellPadding=0 width=781 border=0><TBODY><BR><TR><TD><A href='./home.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>HOME</STRONG></A> </TD>      <TD>  <A href='./login.jsp'><STRONG> <FONT COLOR='BROWN' FACE='CURLZ MT'>LOGIN</STRONG>  </A></TD>      <TD>    <A href='./registration.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>REGISTER</STRONG></A></TD>    <TD> <A href='./sell.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>SELL</STRONG>      </A></TD>   <TD> <A href='./ForSale.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>CURRENT BID ITEMS</STRONG>      </A></TD><TD> <A href='./help.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>HELP</STRONG> </A></TD></TR><TD></TD>  </TBODY></TABLE></p><br><br>");
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
		pw.println("</FORM></p><!-- End ImageReady Slices -->");
		pw.println("<h2><center>Closing ITems Today </h2><br>");
		Statement st2=con.createStatement();
		ResultSet rs2=st2.executeQuery("select * from item_master where to_date(enddate)=to_date(sysdate) ");
		pw.println("<center><table border=3 bordercolor=green>");
		pw.println("<thead><th>Item<Th>Description<Th>Current Price");
		pw.println("<Th>Number Of Bids<Th>Auction Starting Date</thead>");
		while(rs2.next())
		{
		String itemno=rs2.getString(1);
		String desp=rs2.getString(4);
		String cp=rs2.getString(6);
		java.sql.Date sdate=rs2.getDate(8);
		String nob=rs2.getString(11);
		pw.println("<tr><td><a href='./ItemDetails?id="+itemno+"'> "+itemno+"</td>");
		pw.println("<td>" + desp +"</td>");
		pw.println("<td>" + cp +"</td>");
		pw.println("<td>" + nob +"</td>");
		pw.println("<td align=center>" + sdate +"</td></tr>");
		}
		pw.println("</table></center><br><br>");

		pw.println("<h2>Closing ITems Tomarrow </h2><br>");
		Statement st4=con.createStatement();
		ResultSet rs4=st4.executeQuery("select * from item_master where to_date(enddate)=to_date(sysdate+1) ");
		pw.println("<center><table border=3 bordercolor=green>");
		pw.println("<thead><th>Item<Th>Description<Th>Current Price");
		pw.println("<Th>Number Of Bids<Th>Auction Starting Date</thead>");
		while(rs4.next())
		{
		String itemno=rs4.getString(1);
		String desp=rs4.getString(4);
		String cp=rs4.getString(6);
		java.sql.Date sdate=rs4.getDate(8);
		String nob=rs4.getString(11);
		pw.println("<tr><td><a href='./ItemDetails?id="+itemno+"'> "+itemno+"</td>");
		pw.println("<td>" + desp +"</td>");
		pw.println("<td>" + cp +"</td>");
		pw.println("<td>" + nob +"</td>");
		pw.println("<td align=center>" + sdate +"</td></tr>");
		}
		pw.println("</table></center><br><br>");

		pw.println("<CENTER><STRONG></STRONG>");
		pw.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		pw.println("<A href=./EndToday>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home/Search</A>");


	}catch(Exception e) { e.printStackTrace(); }
	}
}
