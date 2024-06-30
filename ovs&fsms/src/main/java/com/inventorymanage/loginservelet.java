package com.inventorymanage;


import java.io.IOException; 
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;
import java.sql.*;


@WebServlet("/loginservelet")
public class loginservelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public loginservelet() {
       super();
       }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("uname"); 
		String pwd = request.getParameter("pass"); 
		String username = "";
        String password = ""; 
		PrintWriter out = response.getWriter(); 
		
		try {
			Connection con = DatabaseUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from employee where username=? and password=?");
			ps.setString(1,name);
			ps.setString(2,pwd);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) 
            {  
                username = rs.getString("username"); 
                password = rs.getString("password");            
            }  

	            ps.close(); 
	            con.close(); 
	            
		}
		catch(Exception e)		
		{
			System.out.println(e);
		}
		
		response.setContentType("text/html"); 
        
		if(name.equals(username) && pwd.equals(password)){
			HttpSession session = request.getSession();
			session.setAttribute("user", username);
			//setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30*60);
			Cookie userName = new Cookie("user", username);
			userName.setMaxAge(30*60);
			response.addCookie(userName);
			response.sendRedirect("inventory.jsp");
		}else{
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/");
			out.println("<font color=red>Either user name or password is wrong.</font>");
			rd.include(request, response);
		}
	}

}
