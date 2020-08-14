package com.akj.carproj.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="booking")
public class IdMain {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int driverId;
	private String bookingId;
	
	public IdMain() {}
	
	public IdMain(Integer driverId,String bookingId) {
		super();
		this.driverId = driverId;
		this.bookingId = bookingId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDriverId() {
		return driverId;
	}
	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
}
