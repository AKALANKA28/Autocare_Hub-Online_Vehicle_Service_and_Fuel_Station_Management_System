package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Customer;
import com.entity.Mechanic;

public class CustomerDao {

	private Connection connection;

	public CustomerDao(Connection conn) {
		super();
		this.connection = conn;
	}

	public boolean register(Customer u) {
		boolean f = false;

		try {
			String sql = "insert into user_dtls(full_name,email,password) values(?,?,?) ";

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public Customer login(String em, String psw) {
		Customer u = null;

		try {
			String sql = "select * from user_dtls where email=? and password=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new Customer();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from user_dtls where id=? and password=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update user_dtls set password=? where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public Customer getCustomerById(int id) {

		Customer c = null;
		try {

			String sql = "select * from user_dtls where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Customer();
				c.setId(rs.getInt(1));
				c.setFullName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPassword(rs.getString(4));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public List<Customer> getAllCustomer() {
		List<Customer> list = new ArrayList<>();
		Customer c = null;
		try {

			String sql = "select * from user_dtls order by id desc";
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Customer();
				c.setId(rs.getInt(1));
				c.setFullName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPassword(rs.getString(4));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean editCustomerProfile(Customer c) {
		boolean f = false;

		try {
			String sql = "update user_dtls set full_name=?,email=?, password=? where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, c.getFullName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPassword());
			ps.setInt(4, c.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	
	public boolean deleteCustomer(int id) {
		boolean f = false;
		try {
			String sql = "delete from user_dtls where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return f;
	}
	
}