package com.web;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class RegistrationServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String theuser, password, fname,lname,emailaddress,phno,address,city,state,pin,country,creditcard,hno,stno;
	Connection con;
	public void init(ServletConfig sc) throws ServletException
	{
		super.init(sc);
		try{
		Class.forName(getServletContext().getInitParameter("driver"));
		con=DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
		}catch(Exception e) { System.out.println(e); }
	}

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
	res.setContentType("text/html");
	PrintWriter pw=res.getWriter();
	try
	{
		theuser = req.getParameter("uname");
		password = req.getParameter("password");
		fname = req.getParameter("fname");
		lname=req.getParameter("lname");
		emailaddress = req.getParameter("email");
		phno = req.getParameter("phno");
		hno=req.getParameter("hno"); 
		stno=req.getParameter("stno");
		address=hno+" : "+stno;
		city =req.getParameter("city");
		state=req.getParameter("state");
		pin=req.getParameter("pin");
		country=req.getParameter("country");
		creditcard = req.getParameter("creditcard");

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

      	
           PreparedStatement ps=con.prepareStatement("insert into uinfo_master values (?,?,?,?,?,?,?,?,?,?,?)");
           ps.setString(1, theuser);
           ps.setString(2, password);
           ps.setString(3, fname);
           ps.setString(4, lname);
           ps.setString(5, emailaddress);
           ps.setString(6, phno);
           ps.setString(7, address);
           ps.setString(8, city);
           ps.setString(9, state);
           ps.setString(10, pin);
           ps.setString(11, country);
           //ps.setString(12, creditcard);
           if (ps.executeUpdate() != 1) {
               throw new Exception ("JDBC did not create any row");
           }

		pw.println(" <br><br><center>u have sucessfully created a user on this Auction House");
		pw.println("<br> u r user name is <b>"+theuser);
		
	}catch(Exception e){pw.println("<br><br><center><b>user name already exists"); }

		pw.println("</b></center><br><br><br><CENTER><STRONG></STRONG>");
		pw.println("<A href='./NewToday'>New Items</A><STRONG></STRONG>");
		pw.println("<A href='./EndToday'>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");
		pw.println("<br><br>");

	}
}