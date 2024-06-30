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
import com.entity.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		int userId = Integer.parseInt(req.getParameter("userid"));
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String phno = req.getParameter("phno");
		String email = req.getParameter("email");
        String service_type = req.getParameter("type");
		String appoint_date = req.getParameter("appoint_date");
        String appoint_time = req.getParameter("time");
		String location = req.getParameter("location");
		int mechanic_id = Integer.parseInt(req.getParameter("mech"));
		String regNo = req.getParameter("regno");
		String mileage = req.getParameter("mileage");
		String message = req.getParameter("message");



		Appointment ap = new Appointment(userId, firstname, lastname, phno, email, service_type, appoint_date,appoint_time, location,mechanic_id, regNo, mileage, message,
				 "Pending");

		AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
		HttpSession session = req.getSession();

		if (dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment Sucessfully");
			resp.sendRedirect("appointment/customer_appointment.jsp");
		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("appointment/customer_appointment.jsp");
		}

	}

}
