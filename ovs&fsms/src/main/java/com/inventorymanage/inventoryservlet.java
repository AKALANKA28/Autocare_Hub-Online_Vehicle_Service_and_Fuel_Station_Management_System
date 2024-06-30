package com.inventorymanage;

import com.inventorymanage.Inventoryclass;
import com.inventorymanage.DatabaseUtil;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet(urlPatterns = "/inventoryactions")

public class inventoryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public inventoryservlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id"); 
		String newname = request.getParameter("name"); 
		String newquantity = request.getParameter("quantity"); 
		String newavailability = request.getParameter("availability"); 
		String newprice = request.getParameter("price"); 
		Inventoryclass inventory = new Inventoryclass(newname, newquantity, newavailability, newprice);
		
		String name=inventory.getname();
		String quantity=inventory.getquantity();
		String availability=inventory.getavailability();
		String price=inventory.getprice();
		
		
	
		if (request.getParameter("add") != null) {
			
			inventorymodel con = new inventorymodel();
			con.update(id, name, quantity, availability, price);

			response.sendRedirect("inventory.jsp");
		}
		else if (request.getParameter("remove") != null) {
			
			inventorymodel con = new inventorymodel();
			con.delete(id, name, quantity, availability, price);
			 
			response.sendRedirect("inventory.jsp");
		}
		else if (request.getParameter("addnew") != null) {
			
			
			inventorymodel con = new inventorymodel();
			con.add(id, name, quantity, availability, price);
			
			response.sendRedirect("inventory.jsp");
		}
		
		
	}

}
