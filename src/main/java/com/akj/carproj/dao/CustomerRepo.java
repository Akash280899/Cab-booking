package com.akj.carproj.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.akj.carproj.model.Customer;

public interface CustomerRepo extends JpaRepository<Customer, Integer>{

}
