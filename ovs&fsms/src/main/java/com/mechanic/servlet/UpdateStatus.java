package com.mechanic.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int mid = Integer.parseInt(req.getParameter("mid"));
			String comm = req.getParameter("comm");

			AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());

			HttpSession session = req.getSession();

			if (dao.updateCommentStatus(id, mid, comm)) {
				session.setAttribute("succMsg", "Comment Updated");
				resp.sendRedirect("mechanic/customer.jsp");
			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("mechanic/customer.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
