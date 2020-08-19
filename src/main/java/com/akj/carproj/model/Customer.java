package com.akj.carproj.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String pickup;
	private String destination;
	private String vehicleType;
	private int fare;
	private String location;
	private String driverName;
	private String carNumber;
	private String otp;
	private String driverImage;
	private int driverId;
	private String bookingId;
	private String status;
	private String phonenumber;
	

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public String getDriverImage() {
		return driverImage;
	}

	public void setDriverImage(String driverImage) {
		this.driverImage = driverImage;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	public Customer() {}
		
	public Customer(String status,String pickup,String destination, String vehicleType,Integer fare,String location,String driverName,String carNumber,String otp,String driverImage,Integer driverId,String bookingId) {
		super();
		this.pickup = pickup;
		this.destination = destination;
		this.vehicleType= vehicleType;
		this.fare = fare;
		this.location = location;
		this.driverName = driverName;
		this.carNumber = carNumber;
		this.otp = otp;
		this.driverImage = driverImage;
		this.driverId = driverId;
		this.bookingId = bookingId;
		this.status = status;
	}


	public String getPickup() {
		return pickup;
	}
	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	
	
	@Override
	public String toString() {
		return "Customer [pickup=" + getPickup() + ", destination=" + getDestination() + ", vehicle=" + getVehicleType() + ",fare=" + getFare() + "location=" + getLocation()+ "]";
	}
	
}
