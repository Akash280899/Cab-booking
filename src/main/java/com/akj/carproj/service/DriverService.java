package com.akj.carproj.service;

import com.akj.carproj.model.Driver;


public interface DriverService {

	public Iterable<Driver> findAll();

	//public void delete(int driverid);
	
	public void deleteAllByDriverId(int driverid);
}
