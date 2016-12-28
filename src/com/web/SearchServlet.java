package com.web;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.rmi.*;
import javax.naming.*;
import java.util.*;
import java.sql.*;

public class SearchServlet extends HttpServlet
{
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
	try
	{
		res.setContentType("text/html");
		PrintWriter pw=res.getWriter();
		
		String sstring   = req.getParameter("sstring");
		String cstring =  req.getParameter("category");
	
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
		java.util.Vector results = new java.util.Vector();
		int val=0;
		 if( (sstring.length()==0) && (!cstring.equals("Choose Category")))
		{
			System.out.println("in second");
			results = searchCatInfo(cstring);
			val=2;
		}
		 if( (sstring.length()==0) && (cstring.equals("Choose Category")))
		{
			System.out.println("in third");
			pw.println("<b><center>give a search string or category<b></center>");
			val=3;
		}
		 if( (sstring.length() != 0) && (!cstring.equals("Choose Category")))
		{
			System.out.println("in fourth");
			results =searchCatItemInfo(sstring,cstring);
			val=4;
		}
		if((sstring.length()!=0) && (cstring.equals("Choose Category")))
		{
			System.out.println("in first");
			results  =searchItemInfo(sstring);
			val=1;
		}
		
		if(val!=3)
		{
		int size=results.size();
		System.out.println(size);	
		pw.println("<br><center><b> U r Search String has found "+size);
		pw.println("records</b></center><br>");
		if(size>0)
		{
		pw.println("<table border=2>");
		pw.println("<tr><td><b>Item Code</b></td><td><b>Category Id</b></td><td><b>Item Name</b></td>");
		pw.println("<td><b>Description</b></td><td><b>Summary</b></td><td><b>Start Price</b></td>");
		pw.println("<td><b>Increament Amount</b></td><td><b>Start Date</b></td><td><b>End Date</b></td>");
		pw.println("<td><b>Seller Id</b></td><td><b>Bid Count</b></td></tr>");
		
		for(int i=0;i<size;i++)
		{
		StringTokenizer st=new StringTokenizer((String)results.elementAt(i),"~");
		pw.println("<tr>");
		String iid=st.nextToken();
		pw.println("<td><a href='./ItemDetails?id="+iid+"' >" +iid+"</a></td>");
		while(st.hasMoreTokens())
		{
			pw.println("<td>"+st.nextToken());
			pw.println("</td>");	
		}
		pw.println("</tr>");
		}
		}
		}
		pw.println("</table></center><br><br><br><CENTER><STRONG></STRONG>");
		pw.println("<A href=./NewToday>New Items</A><STRONG></STRONG>");
		pw.println("<A href=./EndToday>Closing Items</A>");
		pw.println("<STRONG></STRONG><A href=./sell.jsp>Sell Items</A>");
		pw.println("<STRONG></STRONG><A href=./home.jsp>Home</A>");
		pw.println("<br><br>");
		}catch(Exception e){e.printStackTrace();}
	}
	public Vector searchItemInfo(String s)throws RemoteException{
	Vector v = new Vector();
	try{
	PreparedStatement ps = con.prepareStatement("select * from item_master where summary like ?");
	ps.setString(1,"%"+s+"%");
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		String st = rs.getString(1)+"~"+rs.getString(2)+"~"+rs.getString(3)+"~"+rs.getString(4)+"~"+rs.getString(5)+"~"+rs.getString(6)+"~"+rs.getString(7)+"~"+rs.getString(8)+"~"+rs.getString(9)+"~"+rs.getString(10)+"~"+rs.getString(11);
		v.addElement(st);		
	}	
	}catch(Exception e){e.printStackTrace();}
	return v;
	}


     public Vector searchCatInfo(String s)throws RemoteException{
	Vector data = new Vector();
	String st="";
         try{
	PreparedStatement ps = con.prepareStatement("select catid from category_master where cat_name=?");
	ps.setString(1,s);
	ResultSet rs = ps.executeQuery();
	rs.next();
	String id = rs.getString(1);
	rs.close();
	ps.close();
	   if(id != null)
	   {
		PreparedStatement psmt = con.prepareStatement("select * from item_master where catid =?");
		psmt.setString(1,id);	
		ResultSet recs = psmt.executeQuery();
		while(recs.next())
		{
	                     st = recs.getString(1)+"~"+recs.getString(2)+"~"+recs.getString(3)+"~"+recs.getString(4)+"~"+recs.getString(5)+"~"+recs.getString(6)+"~"+recs.getString(7)+"~"+recs.getString(8)+"~"+recs.getString(9)+"~"+recs.getString(10)+"~"+recs.getString(11);
                                  data.addElement(st);
		}
                  }
	}catch(Exception e){e.printStackTrace();}
	return data;
	}


    public Vector searchCatItemInfo(String sString,String cName)throws RemoteException{
	Vector data = new Vector();

	try{

	PreparedStatement ps = con.prepareStatement("select catid from category_master where cat_name=?");
	ps.setString(1,cName);
	ResultSet rs = ps.executeQuery();
	rs.next();
	String id = rs.getString(1);
	System.out.println("cat id : "+id);
	rs.close();
	ps.close();
	   if(id != null)
	   {
		PreparedStatement psmt = con.prepareStatement("select * from item_master where catid =? and summary like ?");
		int id1=Integer.parseInt(id);
		psmt.setInt(1,id1);	
		psmt.setString(2,"%"+sString+"%");
		ResultSet recs = psmt.executeQuery();
		System.out.println("after result set: "+sString);
		while(recs.next())
		{
                                  System.out.println("1");	
	                    String st = recs.getString(1)+"~"+recs.getString(2)+"~"+recs.getString(3)+"~"+recs.getString(4)+"~"+recs.getString(5)+"~"+recs.getString(6)+"~"+recs.getString(7)+"~"+recs.getString(8)+"~"+recs.getString(9)+"~"+recs.getString(10)+"~"+recs.getString(11);
                                  System.out.println("2");	
                                  data.addElement(st);
                                  System.out.println("3");
		}
                  }
	}catch(Exception e){e.printStackTrace();}
	return data;
      }


}