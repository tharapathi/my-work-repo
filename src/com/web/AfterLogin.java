package com.web;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AfterLogin extends HttpServlet
{
	Connection con;
	public void init(ServletConfig sc) throws ServletException
	{
		super.init(sc);
		try
		{
			Class.forName(getServletContext().getInitParameter("driver"));
		con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
		}catch(Exception e) { System.out.println(e); }
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		res.setContentType("text/html");
		PrintWriter pw=res.getWriter();
		HttpSession hs=req.getSession(true);
//		String theuser=(String)hs.getAttribute("user");
		String theuser=req.getParameter("theuser");
		try
		{
		Statement st=con.createStatement();
		System.out.println("select * from uinfo_master where uname='"+theuser+"' ");
		ResultSet rs=st.executeQuery("select * from uinfo_master where uname='"+theuser+"' ");
		String pwd="",fname="",lname="",email="",phno="",address="",city="",state="",pin="",country="",ccardno="";
		while(rs.next())
		{
			pwd=rs.getString(2);
			fname=rs.getString(3);
			lname=rs.getString(4);
			email=rs.getString(5);
			phno=rs.getString(6);
			address=rs.getString(7);
			city=rs.getString(8);
			state=rs.getString(9);
			pin=rs.getString(10);
			country=rs.getString(11);
			//ccardno=rs.getString(12);
		}
        pw.println("<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT=0 MARGINWIDTH=0><!-- ImageReady Slices (Untitled-1) -->");
		//pw.println("<DIV id=Layer1 style='Z-INDEX: 1; LEFT: 410px; WIDTH: 328px; POSITION: absolute; TOP: 65px; HEIGHT: 35px'>");
		pw.println("<p align=right><TABLE cellSpacing=0 cellPadding=0 width=500 border=0><TBODY><BR><TR><TD align=center><A href='./AfterLogin?theuser="+theuser+"'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>My Profile</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Buy.jsp?theuser="+theuser+"'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Buy Item</STRONG></A></TD><td align=center> | </td><TD align=center><A href='./Sold.jsp?theuser="+theuser+"'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>Sold Items</STRONG></A></TD><td align=center> | </td><TD align=center>  <A href='./login.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>LogOut</STRONG></A></TD>  </TR><TD></TD>  </TBODY></TABLE></p><br><br>");
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
		
		pw.println("<marquee behaviour='ALTERNATE'><B><FONT COLOR='BLUE'><FONT FACE='Comic Sans MS' SIZE='6'>SECURED NETAUCTION</FONT></B></marquee><form action=./EditUserInfo method=post>");
		pw.println("<br><br><center><u><h3>Edit Information</h3></u><br>");
		pw.println("<table><tr><td>password: </td><td><input type=password name=password value='"+pwd+"'></td></tr>");
		pw.println("<tr><td>First Name: </td><td><input type=text name=fname value='"+fname+"'></td></tr>");
		pw.println("<tr><td>Last Name: </td><td><input type=text name=lname value='"+lname+"'></td></tr>");
		pw.println("<tr><td>Email: </td><td><input type=text name=email value='"+email+"'></td></tr>");
		pw.println("<tr><td>Phone Number: </td><td><input type=text name=phno value='"+phno+"'></td></tr>");
		pw.println("<tr><td>Address: </td><td><input type=text name=address value='"+address+"'></td></tr>");
		pw.println("<tr><td>City: </td><td><input type=text name=city value='"+city+"'></td></tr>");
		pw.println("<tr><td>State: </td><td><input type=text name=state value='"+state+"'></td></tr>");
		pw.println("<tr><td>Pin Code: </td><td><input type=text name=pin value='"+pin+"'></td></tr>");
		pw.println("<tr><td>Country: </td><td><input type=text name=country value='"+country+"'><input type=hidden name=theuser value='"+theuser+"'></td></tr>");
		pw.println("</table><br>");
		pw.println("<center><input type=submit value='Save Changes' > </form>");

		pw.println("<br><br><br><CENTER><STRONG></STRONG><br><br>");
		pw.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		pw.println("<A href=./EndToday>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");
		pw.println("<br><br>");
		}catch(SQLException se) { System.out.println(se); }
	}
}