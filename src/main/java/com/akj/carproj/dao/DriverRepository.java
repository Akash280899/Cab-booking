package com.akj.carproj.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.akj.carproj.model.Driver;

@Repository("driverRepository")
public interface DriverRepository extends CrudRepository<Driver, Integer> {
	public void deleteAllByDriverId(int driverid);
}
