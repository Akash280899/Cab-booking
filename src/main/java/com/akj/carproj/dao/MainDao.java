package com.akj.carproj.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.akj.carproj.UserRepository;
import com.akj.carproj.model.Main;


@Repository
public class MainDao {
	
	private final UserRepository userRepository;

	public MainDao(UserRepository userRepository) {
		this.userRepository=userRepository;
	}
	
	public void saveMyUser(Main user) {
		userRepository.save(user);
	}    
	
	public Main findByUsernameAndPassword(String username, String password) {
		return userRepository.findByUsernameAndPassword(username, password);
	}
}
