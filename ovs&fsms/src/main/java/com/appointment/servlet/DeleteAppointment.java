package com.appointment.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;



@WebServlet("/deleteAppointment")
public class DeleteAppointment extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
		HttpSession session = req.getSession();

		if (dao.deleteAppointment(id)) {
			session.setAttribute("succMsg", "Appointment Delete Sucessfully..");
			resp.sendRedirect("appointment/view_appointment.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("appointment/view_appointment.jsp");
		}


	}

}