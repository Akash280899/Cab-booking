package com.akj.carproj.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.akj.carproj.model.Admin;


public interface AdminRepo extends JpaRepository<Admin, Integer>{


	public Admin findByUsernameAndPassword(String username, String password);
}
