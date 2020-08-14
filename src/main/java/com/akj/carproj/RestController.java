package com.akj.carproj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.akj.carproj.dao.MainDao;
import com.akj.carproj.model.Main;

public class RestController {

	@Autowired
	private MainDao mainDao;
	public String hello() {
		return "This is Home page";
	}
	
	@GetMapping("/saveuser")
	public String saveUser(@RequestParam Integer id,@RequestParam String username, @RequestParam String password, @RequestParam String address,@RequestParam String phonenumber, @RequestParam String city, @RequestParam String state,@RequestParam String email) {
		Main user = new Main(id,username, password, address,phonenumber, city, state,email);
		mainDao.saveMyUser(user);
		return "User Saved";
	}
	
	
}
