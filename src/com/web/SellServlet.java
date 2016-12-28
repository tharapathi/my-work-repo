package com.web;
import java.io.*;
import java.util.*;
import java.util.Date;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import java.rmi.*;

public class SellServlet extends HttpServlet 
{
    protected SessionCache sessionCache;
    protected long flushTimeout=600000;
    protected long sessionTimeout=7200000;
	
	public Connection getConnection() throws SQLException 
	{
		Connection con=null;
		try{
		Class.forName(getServletContext().getInitParameter("driver"));
		con = DriverManager.getConnection(getServletContext().getInitParameter("durl"),getServletContext().getInitParameter("duser"),getServletContext().getInitParameter("dpass"));
		}
		catch(Exception e){}
		return con;
    	}
    	public void init(ServletConfig config) throws ServletException  
	{
        		super.init(config);
        		sessionCache = new SessionCache (flushTimeout);
    	}

    	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException 
   	{

       		Cookie thisCookie=null;
       		boolean activeSession;
       		String cmd;
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
        pw.println("<BODY bgColor=#a3d881 leftMargin=0 topMargin=0 MARGINHEIGHT=0 MARGINWIDTH=0><!-- ImageReady Slices (Untitled-1) -->");
		//pw.println("<DIV id=Layer1 style='Z-INDEX: 1; LEFT: 410px; WIDTH: 328px; POSITION: absolute; TOP: 65px; HEIGHT: 35px'>");
		
		pw.println("<p align=right><TABLE cellSpacing=0 cellPadding=0 width=781 border=0><TBODY><BR><TR><TD><A href='./home.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>HOME</STRONG></A> </TD>      <TD>  <A href='./login.jsp'><STRONG> <FONT COLOR='BROWN' FACE='CURLZ MT'>LOGIN</STRONG>  </A></TD>      <TD>    <A href='./registration.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>REGISTER</STRONG></A></TD>    <TD> <A href='./sell.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>SELL</STRONG>      </A></TD>   <TD> <A href='./ForSale.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>CURRENT BID ITEMS</STRONG>      </A></TD> <TD> <A href='./help.jsp'><STRONG><FONT COLOR='BROWN' FACE='CURLZ MT'>HELP</STRONG> </A></TD></TR><TD></TD>  </TBODY></TABLE></p><br><br>");
		pw.println("<p align=right><FORM name=form1 action='./SearchServlet'  method=post >Search:<INPUT name=sstring> ");
		pw.println("<SELECT  name=category > <option >Choose Category</option>");
		try{
			Connection con=getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select cat_name from category_master");
		while(rs.next()){
		pw.println("<OPTION>"+rs.getString(1)+"</OPTION>");}
		pw.println("</SELECT> <INPUT type=submit value=Go > ");
		pw.println("</FORM></p><!-- End ImageReady Slices -->");
	
       		Session session = validateSession(request, response);
          		setNoCache(request, response);
			
         		if (session == null ) 
		{
			String seller=request.getParameter("seller");
			String pwd=request.getParameter("password");
			String itemname=request.getParameter("itemname");
			String catname=request.getParameter("category");
			String desc=request.getParameter("description");
			String summary=request.getParameter("summary");
			double startprice=Double.parseDouble(request.getParameter("startprice"));
			double incrprice=Double.parseDouble(request.getParameter("incrprice"));
			int acDays=Integer.parseInt(request.getParameter("auctiondays"));
			
			ResultSet ress=st.executeQuery("select pwd from uinfo_master where uname='"+seller+"' ");
			boolean bol=ress.next();
			if(bol==true)
			{
				String password=ress.getString(1);
				System.out.println(password);
				System.out.println(pwd);
				System.out.println(password.equals(pwd));
				if(password.equals(pwd))
				{
					session = startSession(request.getParameter("seller"), request.getParameter ("password"), response);
					PreparedStatement ps1=con.prepareStatement("select catid from category_master where cat_name=?");
					ps1.setString(1,catname);
					rs=ps1.executeQuery();
					rs.next();
					String catid=rs.getString(1);
					int cword=catid.charAt(0);
					System.out.println("cword: "+cword);
					PreparedStatement ps2=con.prepareStatement("select max(itemid) from item_master"); //where itemid like '"+(char)cword+"%' ");
					ResultSet rs2=ps2.executeQuery();
					rs2.next();
					String temp="";
					int titemid=0;
				                	temp=""+rs2.getString(1);
			              		 System.out.println(temp);
					 if(temp.equals("null"))
		                        		titemid=0;
					else
						titemid=Integer.parseInt(temp);
					//titemid=Integer.parseInt(temp.substring(1));
					System.out.println("1: "+titemid);
					String itemid="";
					titemid++;
					System.out.println("2: "+titemid);
			        //        		itemid=""+(char)cword+"000"+titemid;
					System.out.println("3: "+itemid);
			
					Connection con1 = getConnection();
					Statement st1=con1.createStatement();
					Date date = new Date();
						
					String squery = "insert into item_master values("+titemid+","+catid+",'"+itemname+"','"+desc+"','"+summary+"',"+startprice+","+incrprice+",CURDATE(),DATE_ADD(CURDATE(), INTERVAL -1 +"+acDays+"),'"+seller+"',0) ";
					System.out.println("----" +squery+ " -------");
					int i=st1.executeUpdate(squery);

					pw.println("<b><center> U have Sucess fully have posted u r item to auction online<b><br>");
					pw.println("<br> <center>u r item id is: <b> "+itemid);

					con.close();
				}
				else
				{
					pw.println("<br><br><center>wrong password");
				}
			}
			else
			{
				pw.println("<br><br>user name does not exist");
			}
		}
		pw.println("</b><br><br><br></CENTER><CENTER><STRONG></STRONG>");
		pw.println("<A href='./NewToday'>New Items</A><STRONG></STRONG>");
		pw.println("<A href='./EndToday'>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home/Search</A>");
		}catch(Exception e) { e.printStackTrace(); }
}

    protected boolean verifyPassword(String theuser, String password)
    {
        String originalPassword=null;

        try
        {
           Connection con=getConnection();
           Statement stmt= con.createStatement();
           stmt.executeQuery("select pwd from uinfo_master where uname='"+theuser+"'");
           ResultSet rs = stmt.getResultSet();
	           if(rs.next())
                        {
              			 originalPassword=rs.getString(1);
		           }
           stmt.close();
	con.close();
           if(originalPassword.equals(password))
                {
               return true;
                }
                else
                {
                        return false;
                }

         } catch (Exception e)
                {
           System.out.println("Exception: verifyPassword="+e);
           }
           return false;
      }

    protected Session startSession (String theuser, String password, 
                                           HttpServletResponse response) {
        Session session = null;
        if ( verifyPassword(theuser, password) ) {
            // Create a session
            session = new Session (theuser);
            session.setExpires (sessionTimeout+System.currentTimeMillis());
            sessionCache.put (session);
			
            // Create a client cookie
            Cookie c = new Cookie("AUCTION", String.valueOf (session.getId()));
            c.setMaxAge (-1);
            response.addCookie (c);
	}
	return session;
    }

    private Session validateSession (HttpServletRequest request, HttpServletResponse response) {
       Cookie c[] = request.getCookies();
       Session session = null;
       if ( c != null ) {
          for (int i=0; i < c.length && session == null; i++ ) {
             if(c[i].getName().equals("AUCTION")) {
                String key = String.valueOf (c[i].getValue());
                session=sessionCache.get (key);
             }
          }
       }
       return session;
    }

    protected void endSession (Session session) {
       synchronized (sessionCache) {
          sessionCache.remove (session);
       }
    }

    private void setNoCache (HttpServletRequest request, 
                                       HttpServletResponse response) {

       if(request.getProtocol().compareTo ("HTTP/1.0") == 0) {
           response.setHeader ("Pragma", "no-cache");
       } else if (request.getProtocol().compareTo ("HTTP/1.1") == 0) {
           response.setHeader ("Cache-Control", "no-cache");
       }
       response.setDateHeader ("Expires", 0);
    }

}

