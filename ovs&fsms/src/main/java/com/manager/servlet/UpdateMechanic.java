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
import com.entity.Mechanic;

@WebServlet("/updateMechanic")
public class UpdateMechanic extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");

			int id = Integer.parseInt(req.getParameter("id"));

			Mechanic m = new Mechanic(id,fullName, dob, qualification, email, mobno, password);

			MechanicDao dao = new MechanicDao(DBConnect.getConnection());
			HttpSession session = req.getSession();

			if (dao.updateMechanic(m)) {
				session.setAttribute("succMsg", "Mechanic Update Sucessfully..");
				resp.sendRedirect("manager/view_mechanic.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("manager/view_mechanic.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
