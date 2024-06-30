package com.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MechanicDao;
import com.db.DBConnect;

@WebServlet("/deleteMechanic")
public class DeleteMechanic extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		MechanicDao dao = new MechanicDao(DBConnect.getConnection());
		HttpSession session = req.getSession();

		if (dao.deleteMechanic(id)) {
			session.setAttribute("succMsg", "Mechanic Delete Sucessfully..");
			resp.sendRedirect("manager/view_mechanic.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("manager/view_mechanic.jsp");
		}


	}

}