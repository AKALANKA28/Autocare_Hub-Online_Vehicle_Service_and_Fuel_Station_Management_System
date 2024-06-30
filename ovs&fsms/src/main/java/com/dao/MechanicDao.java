package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Mechanic;

public class MechanicDao {
	private Connection conn;

	public MechanicDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerMechanic(Mechanic m) {
		boolean f = false;

		try {
			String sql = "insert into mechanic(full_name,dob,qualification,email,mobno,password) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getFullName());
			ps.setString(2, m.getDob());
			ps.setString(3, m.getQualification());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getMobNo());
			ps.setString(6, m.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Mechanic> getAllMechanic() {
		List<Mechanic> list = new ArrayList<>();
		Mechanic m = null;
		try {

			String sql = "select * from mechanic order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new Mechanic();
				m.setId(rs.getInt(1));
				m.setFullName(rs.getString(2));
				m.setDob(rs.getString(3));
				m.setQualification(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setMobNo(rs.getString(6));
				m.setPassword(rs.getString(7));
				list.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Mechanic getMechanicById(int id) {

		Mechanic m = null;
		try {

			String sql = "select * from mechanic where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new Mechanic();
				m.setId(rs.getInt(1));
				m.setFullName(rs.getString(2));
				m.setDob(rs.getString(3));
				m.setQualification(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setMobNo(rs.getString(6));
				m.setPassword(rs.getString(7));

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return m;
	}

	public boolean updateMechanic(Mechanic m) {
		boolean f = false;

		try {
			String sql = "update mechanic set full_name=?,dob=?,qualification=?,email=?,mobno=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getFullName());
			ps.setString(2, m.getDob());
			ps.setString(3, m.getQualification());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getMobNo());
			ps.setString(6, m.getPassword());
			ps.setInt(7, m.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return f;
	}

	public boolean deleteMechanic(int id) {
		boolean f = false;
		try {
			String sql = "delete from mechanic where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
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

	public Mechanic login(String email, String psw) {
		Mechanic m = null;
		try {

			String sql = "select * from mechanic where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new Mechanic();
				m = new Mechanic();
				m.setId(rs.getInt(1));
				m.setFullName(rs.getString(2));
				m.setDob(rs.getString(3));
				m.setQualification(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setMobNo(rs.getString(6));
				m.setPassword(rs.getString(7));
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return m;
	}

	public int countMechanic() {
		int i = 0;
		try {
			String sql = "select * from mechanic";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return i;
	}

	public int countAppointment() {
		int i = 0;
		try {
			String sql = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			System.out.println(e);;
		}

		return i;
	}

	public int countAppointmentByMechanicId(int did) {
		int i = 0;
		try {
			String sql = "select * from appointment where mechanic_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return i;
	}

	public int countCustomer() {
		int i = 0;
		try {
			String sql = "select * from user_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return i;
	}


	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from mechanic where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return f;
	}

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update mechanic set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return f;
	}

	public boolean editMechanicProfile(Mechanic m) {
		boolean f = false;

		try {
			String sql = "update mechanic set full_name=?,dob=?,qualification=?,email=?,mobno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getFullName());
			ps.setString(2, m.getDob());
			ps.setString(3, m.getQualification());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getMobNo());
			ps.setInt(6, m.getId());
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