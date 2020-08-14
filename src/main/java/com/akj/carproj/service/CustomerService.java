package com.akj.carproj.service;

import com.akj.carproj.model.Customer;

public interface CustomerService {

	public Iterable<Customer> findAll();

	public void delete(int id);
}
