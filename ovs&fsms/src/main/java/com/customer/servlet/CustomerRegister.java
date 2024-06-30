package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDao;
import com.db.DBConnect;
import com.entity.Customer;

@WebServlet("/customerRegister")
public class CustomerRegister extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			Customer u = new Customer(fullName, email, password);

			CustomerDao dao = new CustomerDao(DBConnect.getConnection());

			HttpSession session = req.getSession();

			boolean f = dao.register(u);

			if (f) {

				session.setAttribute("sucMsg", "Register Sucessfully");
				resp.sendRedirect("customer/customer_login.jsp");

			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("customer/signup.jsp");
			}

		} catch (Exception e) {
			System.out.println(e);;
		}

	}

}