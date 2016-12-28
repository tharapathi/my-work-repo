package com.web;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.rmi.*;
import javax.naming.*;
import java.util.*;

public class AuctionServlet extends HttpServlet 
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
		res.setContentType("text/html");
		pw=res.getWriter();
		try{
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
		pw.println("</FORM></p><!-- End ImageReady Slices -->");
		Statement st=con.createStatement();
		String bidder=req.getParameter("bidder");
		String pwd=req.getParameter("password");
		String amount=req.getParameter("amount");
		if(amount.length()>0)
		{
		int amt=Integer.parseInt(amount);
		String id=req.getParameter("id");
		int hbid=Integer.parseInt(req.getParameter("hbid"));
		int min=Integer.parseInt(req.getParameter("min"));
		ResultSet rs=st.executeQuery("select pwd from uinfo_master where uname='"+bidder+"' ");
		if(rs.next())
		{
			String dpwd=rs.getString(1);
			if(!pwd.equals(dpwd))
				pw.println("<center><b>in valid password</b></center><br<br>");
			else if(amt>=(hbid+min))
			{
				Statement stmt=con.createStatement();
				/*ResultSet rst=stmt.executeQuery("select enddate from item_master where itemid="+id);
				rst.next();
				java.sql.Date dt=rst.getDate(1);
				Statement stmt2=con.createStatement();
				ResultSet rst1=stmt2.executeQuery("select sysdate from dual");
				rst1.next();
				java.sql.Date dt1=rst1.getDate(1);
				java.util.StringTokenizer stok=new java.util.StringTokenizer(dt.toString(),"-");
				StringTokenizer token=new StringTokenizer(dt.toString(),"-");
				int year=Integer.parseInt(token.nextToken());
				int month=Integer.parseInt(token.nextToken());
				int day=Integer.parseInt(token.nextToken());
		           
				StringTokenizer token1=new StringTokenizer(dt1.toString(),"-");
				int year1=Integer.parseInt(token1.nextToken());
				int month1=Integer.parseInt(token1.nextToken());
				int day1=Integer.parseInt(token1.nextToken());
				System.out.println("Date difference=="+dt+"-"+dt1);*/

                ResultSet rst=stmt.executeQuery("select enddate-sysdate from item_master where itemid="+id); 
				if(rst.next())
				{
					int dif=rst.getInt(1);
					if(dif<0)
					{
						 pw.println("<center><b>auction is closed a "+(-1)*dif+" day(s) before</b><br<br></center>");
					}
				/*if((year >= year1))
				{
					if((month >= month1))
					{
						System.out.println("day==="+day+"==day1==="+day1);
						if((day >= day1))
						{*/
						else{
						Statement stmt1=con.createStatement();
						int i=stmt1.executeUpdate("Update bidding_info set status=0 where itemid="+id+" and status!=2");
					    i=stmt1.executeUpdate("insert into bidding_info values('"+bidder+"',"+amt+","+id+",sysdate,1) ");
						    
						Statement stm1=con.createStatement();
						stm1.executeUpdate("update item_master set bidcnt=bidcnt+1 where itemid="+id+" ");
						pw.println("<center><b>congratulations u have sucessfully bid for the item</b><br<br></center>");
						}
						/*else
						{
							pw.println("<center><b>auction is closed a "+(day1-day)+" day before</b><br<br></center>");
						}
					}
					else
					{
						pw.println("<center><b>auction closed a "+(month1-month)+" month before</b><br<br></center>");
					}*/
				}
				/*else
				{
					pw.println("<center><b>auction closed a "+(year1-year)+" year before</b><br<br></center>");
				}*/
			}
			else
			{
				pw.println("<center><b>bid more than current value + mininmum increament</b><br<br></center>");	
			}
		}
		else
		{
			pw.println("<center><b>User Name doesnot exist</b></center><br<br>");
		}
		}
		else
		{
			pw.println("<br><center>specify the bid amount</center>");
		}

	}catch(NumberFormatException ne) { pw.println("<br><b><center>enter a numeric value</center></b><br><br>");
	}catch(Exception e) { e.printStackTrace(); }
		pw.println("<br><br><br><CENTER><STRONG></STRONG>");
		pw.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		pw.println("<A href=./EndToday>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");

	}
}