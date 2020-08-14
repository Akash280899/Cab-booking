package com.akj.carproj.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.akj.carproj.dao.ProductRepository;
import com.akj.carproj.model.Customer;

@Transactional
@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private ProductRepository productRepository;

	@Override
	public Iterable<Customer> findAll() {
		return productRepository.findAll();
	}

	@Override
	public void delete(int id) {
		productRepository.deleteById(id);
	}
}
