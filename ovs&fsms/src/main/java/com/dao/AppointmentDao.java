package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
public class AppointmentDao {

	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap) {
		boolean f = false;

		try {

			String sql = "insert into appointment(user_id,first_name,last_name,phno,email,service_type,appoint_date,appoint_time,location,mechanic_id,vehicle_reg_no,mileage,message,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFirstName());
			ps.setString(3, ap.getLastName());
			ps.setString(4, ap.getPhNo());
			ps.setString(5, ap.getEmail());
			ps.setString(6, ap.getServiceType());
			ps.setString(7, ap.getAppoinDate());
			ps.setString(8, ap.getAppointTime());
			ps.setString(9, ap.getLocation());
			ps.setInt(10, ap.getMechanicId());
			ps.setString(11, ap.getVehicleRegNo());
			ps.setString(12, ap.getMileage());
			ps.setString(13, ap.getMessage());
			ps.setString(14, ap.getStatus());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAllAppointmentByLoginCustomer(int userId) {
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFirstName(rs.getString(3));
				ap.setLastName(rs.getString(4));
				ap.setPhNo(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setServiceType(rs.getString(7));
				ap.setAppoinDate(rs.getString(8));
				ap.setAppointTime(rs.getString(9));
				ap.setLocation(rs.getString(10));
				ap.setMechanicId(rs.getInt(11));
				ap.setVehicleRegNo(rs.getString(12));
				ap.setMileage(rs.getString(13));
				ap.setMessage(rs.getString(14));
				ap.setStatus(rs.getString(15));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Appointment> getAllAppointmentByMechanicLogin(int mechId) {
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment where mechanic_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mechId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFirstName(rs.getString(3));
				ap.setLastName(rs.getString(4));
				ap.setPhNo(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setServiceType(rs.getString(7));
				ap.setAppoinDate(rs.getString(8));
				ap.setAppointTime(rs.getString(9));
				ap.setLocation(rs.getString(10));
				ap.setMechanicId(rs.getInt(11));
				ap.setVehicleRegNo(rs.getString(12));
				ap.setMileage(rs.getString(13));
				ap.setMessage(rs.getString(14));
				ap.setStatus(rs.getString(15));
				list.add(ap);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

	public Appointment getAppointmentById(int id) {

		Appointment ap = null;

		try {

			String sql = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFirstName(rs.getString(3));
				ap.setLastName(rs.getString(4));
				ap.setPhNo(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setServiceType(rs.getString(7));
				ap.setAppoinDate(rs.getString(8));
				ap.setAppointTime(rs.getString(9));
				ap.setLocation(rs.getString(10));
				ap.setMechanicId(rs.getInt(11));
				ap.setVehicleRegNo(rs.getString(12));
				ap.setMileage(rs.getString(13));
				ap.setMessage(rs.getString(14));
				ap.setStatus(rs.getString(15));

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return ap;
	}

	public boolean updateCommentStatus(int id, int mechId, String comm) {
		boolean f = false;
		try {
			String sql = "update appointment set status=? where id=? and mechanic_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, mechId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
		
			System.out.println(e);
		}

		return f;
	}

	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFirstName(rs.getString(3));
				ap.setLastName(rs.getString(4));
				ap.setPhNo(rs.getString(5));
				ap.setEmail(rs.getString(6));
				ap.setServiceType(rs.getString(7));
				ap.setAppoinDate(rs.getString(8));
				ap.setAppointTime(rs.getString(9));
				ap.setLocation(rs.getString(10));
				ap.setMechanicId(rs.getInt(11));
				ap.setVehicleRegNo(rs.getString(12));
				ap.setMileage(rs.getString(13));
				ap.setMessage(rs.getString(14));
				ap.setStatus(rs.getString(15));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteAppointment(int id) {
		boolean f = false;
		try {
			String sql = "delete from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean updateAppointment(Appointment ap) {
		boolean f = false;

		try {
			String sql = "update appointment set firstname=?, lastname=?, phno=?, email=?, service_type=?, appoint_date=?, appoint_time=?, location=?, mechanic_id=?, regNo=?, mileage=?, message=?, status=? where id=? and user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ap.getFirstName());
			ps.setString(2, ap.getLastName());
			ps.setString(3, ap.getPhNo());
			ps.setString(4, ap.getEmail());
			ps.setString(5, ap.getServiceType());
			ps.setString(6, ap.getAppoinDate());
			ps.setString(7, ap.getAppointTime());
			ps.setString(8, ap.getLocation());
			ps.setInt(9, ap.getMechanicId());
			ps.setString(10, ap.getVehicleRegNo());
			ps.setString(11, ap.getMileage());
			ps.setString(12, ap.getMessage());
			ps.setString(13, ap.getStatus());
		    ps.setInt(14, ap.getId());
		    ps.setInt(15, ap.getUserId());
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
