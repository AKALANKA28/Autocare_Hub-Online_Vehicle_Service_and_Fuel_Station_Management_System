package com.mechanic.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mechanicLogout")
public class MechanicLogout extends HttpServlet{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		session.removeAttribute("mechObj");
		session.setAttribute("succMsg", "Mechanic Logout Sucessfully");
		resp.sendRedirect("mechanic/mechanic_login.jsp");

	}



}