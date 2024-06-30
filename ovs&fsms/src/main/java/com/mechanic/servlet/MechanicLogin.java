package com.mechanic.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MechanicDao;
import com.db.DBConnect;
import com.entity.Mechanic;

@WebServlet("/mechanicLogin")
public class MechanicLogin extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		MechanicDao dao = new MechanicDao(DBConnect.getConnection());
		Mechanic mechanic = dao.login(email, password);

		if (mechanic != null) {
			session.setAttribute("mechObj", mechanic);
			resp.sendRedirect("mechanic/index.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email & password");
			resp.sendRedirect("mechanic/mechanic_login.jsp");
		}

	}

}
