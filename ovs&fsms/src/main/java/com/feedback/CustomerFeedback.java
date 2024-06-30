package com.feedback;

public class CustomerFeedback extends Feedback {
	private int rating; 
    private String serviceType; 

	public CustomerFeedback() {
		
	}

	
	public CustomerFeedback(int id, int userID, String timestamp, String message, String feedbackType, int rating, String serviceType) {
		super(id, userID, timestamp, message, feedbackType);
		this.rating = rating;
		this.serviceType = serviceType;
	}


	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	
	

}
