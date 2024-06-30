package com.feedback;

public class Feedback {

	 private int id;
	 private int userID;  // The ID of the user giving feedback, be it a customer or employee.
	 private String timestamp;
	 private String message;
	 private String feedbackType;
	public Feedback() {
		super();
		
	}
	public Feedback(int id, int userID, String timestamp, String message, String feedbackType) {
		super();
		this.id = id;
		this.userID = userID;
		this.timestamp = timestamp;
		this.message = message;
		this.feedbackType = feedbackType;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getFeedbackType() {
		return feedbackType;
	}
	public void setFeedbackType(String feedbackType) {
		this.feedbackType = feedbackType;
	}
	 
	
	 
}
