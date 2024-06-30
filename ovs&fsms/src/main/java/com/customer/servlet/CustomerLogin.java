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

@WebServlet("/customerLogin")
public class CustomerLogin extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		CustomerDao dao = new CustomerDao(DBConnect.getConnection());
		Customer customer = dao.login(email, password);

		if (customer != null) {
			session.setAttribute("cusObj", customer);
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email & password");
			resp.sendRedirect("customer/customer_login.jsp");
		}

	}

}