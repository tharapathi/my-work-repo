package com.web;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EditUserInfo extends HttpServlet
{
	Connection con;
	PreparedStatement ps;
	public void init(ServletConfig sc) throws ServletException
	{
		super.init(sc);
		try
		{
		Class.forName(getServletContext().getInitParameter("driver"));
		con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
		ps=con.prepareStatement("update uinfo_master set pwd=?,fname=?,lname=?,email=?,phno=?,address=?,city=?,state=?,pin=?,country=? where uname=?");
		}catch(Exception e) { System.out.println(e); }
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException
	{
		try
		{
		res.setContentType("text/html");
		PrintWriter pw=res.getWriter();
		HttpSession hs=req.getSession(true);

//		String user=(String)hs.getValue("user");
		String user=req.getParameter("theuser");
		String pwd=req.getParameter("password");
		String fname=req.getParameter("fname");
		String lname=req.getParameter("lname");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String address=req.getParameter("address");
		String city=req.getParameter("city");
		String state=req.getParameter("state");
		String pin=req.getParameter("pin");
		String country=req.getParameter("country");
		String ccardno=req.getParameter("ccardno");		

		ps.setString(1,pwd);
		ps.setString(2,fname);
		ps.setString(3,lname);
		ps.setString(4,email);
		ps.setString(5,phno);
		ps.setString(6,address);
		ps.setString(7,city);
		ps.setString(8,state);
		ps.setString(9,pin);
		ps.setString(10,country);
		//ps.setString(11,ccardno);
		ps.setString(11,user);
		
		int i=ps.executeUpdate();		
		
        pw.println("<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT=0 MARGINWIDTH=0><!-- ImageReady Slices (Untitled-1) -->");
		//pw.println("<DIV id=Layer1 style='Z-INDEX: 1; LEFT: 410px; WIDTH: 328px; POSITION: absolute; TOP: 65px; HEIGHT: 35px'>");
		pw.println("<p align=right><TABLE cellSpacing=0 cellPadding=0 width=500 border=0><TBODY><BR><TR><TD align=center><A href='./AfterLogin?theuser="+user+"'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>My Profile</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Buy.jsp?theuser="+user+"'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Buy Item</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Sold.jsp?theuser="+user+"'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Sold Items</STRONG></A></TD><td align=center> | </td><TD align=center>  <A href='./login.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>LogOut</STRONG></A></TD>  </TR><TD></TD>  </TBODY></TABLE></p><br><br>");
		/*pw.println("<p align=right><FORM name=form1 action='./SearchServlet'  method=post >Search:<INPUT name=sstring> ");
		pw.println("<SELECT  name=category > <option >Choose Category</option>");
		try
		{
		st=con.createStatement();
		rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){
		pw.println("<OPTION>"+rs.getString(1)+"</OPTION>");}
		}
		catch(Exception e){}
		pw.println("</SELECT> <INPUT type=submit value=Go > ");
		pw.println("</FORM></p><!-- End ImageReady Slices -->");*/
		
		pw.println("<marquee behaviour='ALTERNATE'><B><FONT COLOR='BLUE'><FONT FACE='Comic Sans MS' SIZE='6'>SECURED NETAUCTION</FONT></B></marquee>");

		if(i==1)
		{
		pw.println("<br><br><br><b><center>Your profile has been Updated</center></b>");
		}
		else
		{
		pw.println("<br><center>Problem with Database");
		}

		pw.println("<br><br><br><CENTER><STRONG></STRONG><br><br>");
		pw.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		pw.println("<A href=./EndToday>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");
		pw.println("<br><br>");

		}catch(Exception e) { System.out.println(e); }
	}
}