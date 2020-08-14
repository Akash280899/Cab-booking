package com.akj.carproj.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.akj.carproj.model.Customer;
import com.akj.carproj.model.Main;

public interface UserRepo extends JpaRepository<Customer, Integer>{

	//@Query("UPDATE customer set status = :status WHERE ")
}