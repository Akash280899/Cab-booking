package com.akj.carproj.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akj.carproj.dao.DriverRepository;
import com.akj.carproj.model.Driver;

@Transactional
@Service("driverService")
public class DriverServiceImpl implements DriverService{

	@Autowired
	private DriverRepository driverRepository;

	@Override
	public Iterable<Driver> findAll() {
		return driverRepository.findAll();
	}

	@Override
	public void deleteAllByDriverId(int driverid) {
		driverRepository.deleteAllByDriverId(driverid);
	}
}