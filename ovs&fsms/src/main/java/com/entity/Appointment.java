package com.entity;

public class Appointment {

	private int id;
	private int userId;
	private String firstName;
	private String lastName;
	private String phNo;
	private String email;
	private String serviceType;
	private String appoinDate;
	private String appointTime;
	private String location;
	private int mechanicId;
	private String vehicleRegNo;
	private String mileage;
	private String message;
	private String status;

	public Appointment() {

	}




	public Appointment(int id, int userId, String firstName, String lastName, String phNo, String email,
			String serviceType, String appoinDate, String appointTime, String location, int mechanicId,
			String vehicleRegNo, String mileage,  String message, String status) {
		super();
		this.id = id;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phNo = phNo;
		this.email = email;
		this.serviceType = serviceType;
		this.appoinDate = appoinDate;
		this.appointTime = appointTime;
		this.location = location;
		this.mechanicId = mechanicId;
		this.vehicleRegNo = vehicleRegNo;
		this.mileage = mileage;
		this.message = message;
		this.status = status;
	}




	public Appointment( int userId, String firstName, String lastName, String phNo, String email,
			String serviceType, String appoinDate, String appointTime, String location, int mechanicId,
			String vehicleRegNo, String mileage,   String message,String status) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phNo = phNo;
		this.email = email;
		this.serviceType = serviceType;
		this.appoinDate = appoinDate;
		this.appointTime = appointTime;
		this.location = location;
		this.mechanicId = mechanicId;
		this.vehicleRegNo = vehicleRegNo;
		this.mileage = mileage;
		this.message = message;
		this.status = status;
	}




	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public String getPhNo() {
		return phNo;
	}



	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getServiceType() {
		return serviceType;
	}



	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}



	public String getAppoinDate() {
		return appoinDate;
	}



	public void setAppoinDate(String appoinDate) {
		this.appoinDate = appoinDate;
	}



	public String getAppointTime() {
		return appointTime;
	}



	public void setAppointTime(String appointTime) {
		this.appointTime = appointTime;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public int getMechanicId() {
		return mechanicId;
	}



	public void setMechanicId(int doctorId) {
		this.mechanicId = doctorId;
	}



	public String getVehicleRegNo() {
		return vehicleRegNo;
	}



	public void setVehicleRegNo(String vehicleRegNo) {
		this.vehicleRegNo = vehicleRegNo;
	}



	public String getMileage() {
		return mileage;
	}



	public void setMileage(String mileage) {
		this.mileage = mileage;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	}

