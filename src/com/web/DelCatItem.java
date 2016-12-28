package com.web;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class DelCatItem extends HttpServlet
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
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		
		try{
		Statement st=con.createStatement();
		String s[]=req.getParameterValues("chk");
		ResultSet rs=null;
		for(int i=0;i<s.length;i++)
		{
			try
			{
			  st.executeQuery("delete from category_master where catid="+s[i]);
			}
			catch(Exception e1)
		    {
		    	e1.printStackTrace();
	    	}
		}
           RequestDispatcher rd=req.getRequestDispatcher("./DelItemCat");
		   rd.forward(req,res);
       	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}