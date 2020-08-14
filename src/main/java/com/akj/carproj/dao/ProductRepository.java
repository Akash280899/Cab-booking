package com.akj.carproj.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.akj.carproj.model.Customer;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Customer, Integer> {
}
