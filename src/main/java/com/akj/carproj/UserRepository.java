package com.akj.carproj;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.akj.carproj.model.Main;


public interface UserRepository extends CrudRepository<Main, Integer> {	
	
	public Main findByUsernameAndPassword(String username, String password);
}

