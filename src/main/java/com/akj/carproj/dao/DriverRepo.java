package com.akj.carproj.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.akj.carproj.model.Driver;

public interface DriverRepo extends JpaRepository<Driver, Integer>{

	//@Query("UPDATE customer set status = :status WHERE ")
	public Driver findByUsernameAndPassword(String username, String password);
}
