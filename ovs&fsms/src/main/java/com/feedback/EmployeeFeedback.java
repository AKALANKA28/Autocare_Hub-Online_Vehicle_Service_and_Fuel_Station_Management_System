package com.feedback;

public class EmployeeFeedback extends Feedback {
	
	 private String category; 
	 private String department;

	public EmployeeFeedback() {
		// TODO Auto-generated constructor stub
	}

	public EmployeeFeedback(int id, int userID, String timestamp, String message, String feedbackType, String category, String department ) {
		super(id, userID, timestamp, message, feedbackType);
		this.category = category;
		this.department = department;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	

}
