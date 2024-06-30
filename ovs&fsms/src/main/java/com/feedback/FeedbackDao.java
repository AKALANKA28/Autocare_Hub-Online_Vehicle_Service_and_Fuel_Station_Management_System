package com.feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDao {
	private Connection conn;


	public FeedbackDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addFeedback(Feedback feedback) throws SQLException {
	    String feedbackQuery = "INSERT INTO feedback (userID, timestamp, message, rating, serviceType, category, department, feedbackType) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    PreparedStatement pstmt = conn.prepareStatement(feedbackQuery);
	    pstmt.setInt(1, feedback.getUserID());
	    pstmt.setString(2, feedback.getTimestamp());
	    pstmt.setString(3, feedback.getMessage());
	    if (feedback instanceof CustomerFeedback) {
	        pstmt.setInt(4, ((CustomerFeedback) feedback).getRating());
	        pstmt.setString(5, ((CustomerFeedback) feedback).getServiceType());
	        pstmt.setNull(6, Types.VARCHAR);
	        pstmt.setNull(7, Types.VARCHAR);
	    } else if (feedback instanceof EmployeeFeedback) {
	        pstmt.setNull(4, Types.INTEGER);
	        pstmt.setNull(5, Types.VARCHAR);
	        pstmt.setString(6, ((EmployeeFeedback) feedback).getCategory());
	        pstmt.setString(7, ((EmployeeFeedback) feedback).getDepartment());
	    }
	    pstmt.setString(8, feedback.getFeedbackType());
	    int affectedRows = pstmt.executeUpdate();
	    return affectedRows > 0;
	}


	public List<CustomerFeedback> getAllCustomerFeedback() throws SQLException {
	    List<CustomerFeedback> feedbackList = new ArrayList<>();

	    String query = "SELECT * FROM feedback WHERE feedbackType='customer'";
	    PreparedStatement pstmt = conn.prepareStatement(query);

	    ResultSet rs = pstmt.executeQuery();
	    while (rs.next()) {
	        CustomerFeedback feedback = new CustomerFeedback();
	        feedback.setId(rs.getInt("id"));
	        feedback.setUserID(rs.getInt("userID"));
	        feedback.setTimestamp(rs.getString("timestamp"));
	        feedback.setMessage(rs.getString("message"));
	        feedback.setRating(rs.getInt("rating"));
	        feedback.setServiceType(rs.getString("serviceType"));

	        feedbackList.add(feedback);
	    }

	    return feedbackList;
	}
	
	public List<CustomerFeedback> getCustomerFeedbackByUserId(int userId) throws SQLException {
	    List<CustomerFeedback> feedbackList = new ArrayList<>();

	    String query = "SELECT * FROM feedback WHERE feedbackType='customer' AND userID=?";
	    PreparedStatement pstmt = conn.prepareStatement(query);
	    pstmt.setInt(1, userId);  // set userID in the prepared statement

	    ResultSet rs = pstmt.executeQuery();
	    while (rs.next()) {
	        CustomerFeedback feedback = new CustomerFeedback();
	        feedback.setId(rs.getInt("id"));
	        feedback.setUserID(rs.getInt("userID"));
	        feedback.setTimestamp(rs.getString("timestamp"));
	        feedback.setMessage(rs.getString("message"));
	        feedback.setRating(rs.getInt("rating"));
	        feedback.setServiceType(rs.getString("serviceType"));

	        feedbackList.add(feedback);
	    }

	    return feedbackList;
	}

	
	public List<EmployeeFeedback> getAllEmployeeFeedback() throws SQLException {
	    List<EmployeeFeedback> feedbackList = new ArrayList<>();

	    String query = "SELECT * FROM feedback WHERE feedbackType='employee'";
	    PreparedStatement pstmt = conn.prepareStatement(query);

	    ResultSet rs = pstmt.executeQuery();
	    while (rs.next()) {
	        EmployeeFeedback feedback = new EmployeeFeedback();
	        feedback.setId(rs.getInt("id"));
	        feedback.setUserID(rs.getInt("userID"));
	        feedback.setTimestamp(rs.getString("timestamp"));
	        feedback.setMessage(rs.getString("message"));
	        feedback.setCategory(rs.getString("categoy"));
	        feedback.setDepartment(rs.getString("department"));

	        feedbackList.add(feedback);
	    }

	    return feedbackList;
	}

	public boolean updateFeedback(Feedback feedback) throws SQLException {
	    String updateQuery = "UPDATE feedback SET userID = ?, timestamp = ?, message = ?, rating = ?, serviceType = ?, category = ?, department = ? feedbackType = ? WHERE feedbackID = ?";
	    PreparedStatement pstmt = conn.prepareStatement(updateQuery);
	    pstmt.setInt(1, feedback.getUserID());
	    pstmt.setString(2, feedback.getTimestamp());
	    pstmt.setString(3, feedback.getMessage());
	    
	    if (feedback instanceof CustomerFeedback) {
	        pstmt.setInt(4, ((CustomerFeedback) feedback).getRating());
	        pstmt.setString(5, ((CustomerFeedback) feedback).getServiceType());
	        pstmt.setNull(6, Types.VARCHAR);
	        pstmt.setNull(7, Types.VARCHAR);
	        pstmt.setString(8, ((CustomerFeedback) feedback).getFeedbackType());

	    } else if (feedback instanceof EmployeeFeedback) {
	        pstmt.setNull(4, Types.INTEGER);
	        pstmt.setNull(5, Types.VARCHAR);
	        pstmt.setString(6, ((EmployeeFeedback) feedback).getCategory());
	        pstmt.setString(7, ((EmployeeFeedback) feedback).getDepartment());
	        pstmt.setString(8, ((EmployeeFeedback) feedback).getFeedbackType());

	    }
	    
	    pstmt.setInt(8, feedback.getId()); 
	    
	    int affectedRows = pstmt.executeUpdate();
	    return affectedRows > 0;
	}
	
	
	public boolean deleteFeedback(int feedbackID) throws SQLException {
	    String deleteQuery = "DELETE FROM feedback WHERE id = ?";
	    PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
	    pstmt.setInt(1, feedbackID);
	    
	    int affectedRows = pstmt.executeUpdate();
	    return affectedRows > 0;
	}
	
	
	
	public int countFeedback() {
		int i = 0;
		try {
			String sql = "select * from feedback";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}


}
