package com.akj.carproj;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.akj.carproj.dao.DriverRepo;
import com.akj.carproj.model.Driver;
import com.akj.carproj.model.Main;

@Controller
/* @RequestMapping(value = "driver") */ 
public class AccountController {
	
	@Autowired
	UserRepository userrepo;
	
	@Autowired
	DriverRepo driverRepo;

	/*
	 * @RequestMapping(method = RequestMethod.GET) public String index() { return
	 * "account/index"; }
	 */
	
	/*
	 * @RequestMapping(value = "temp", method = RequestMethod.GET) public String
	 * temp() { return "account/temp"; }
	 * 
	 */
	/*@RequestMapping("driver/loginIndex")
	public String loginIndex() {
		return "driver/loginIndex";
	}*/

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(
		@RequestParam("username") String username,
		@RequestParam("password") String password,
		HttpSession session,
		ModelMap modelMap) {
		Driver name = driverRepo.findByUsernameAndPassword(username, password);
		//Main name = userrepo.findByUsernameAndPassword(username, password);
		try {
		if(username.equalsIgnoreCase(name.getUsername()) && password.equalsIgnoreCase(name.getPassword())) {
			session.setAttribute("Driverusername", username);
			session.setAttribute("DriverId", name.getDriverId());
			session.setAttribute("logged", "yes");
			return "DriverHome";
		} }
		catch(NullPointerException e) {
			modelMap.put("error", "Invalid Credentials.Try to login with correct credentials!!");
			return "loginIndex";
		}
		return "";
		
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("Driverusername");
		session.removeAttribute("logged");
		session.removeAttribute("DriverId");
		return "DriverHome";
	}
	
	

}
