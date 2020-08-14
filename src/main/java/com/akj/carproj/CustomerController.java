package com.akj.carproj;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.akj.carproj.dao.DriverRepo;
import com.akj.carproj.dao.EmpDao;
import com.akj.carproj.model.Driver;
import com.akj.carproj.model.Main;

@Controller
/* @RequestMapping(value = "driver") */ 
public class CustomerController {
	
	@Autowired    
	EmpDao dao;
	
	@Autowired
	UserRepository userrepo;
	
	@Autowired
	DriverRepo driverRepo;

	
	
	@RequestMapping("/loginCustomer")
	public String loginIndex() {
		return "loginCustomer";
	}
	
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute("emp") Main emp) {
		 dao.update(emp);    
	     return "index";     
	}
	@RequestMapping(value = "/loginCustomer", method = RequestMethod.POST)
	public String login(
		@RequestParam("username") String username,
		@RequestParam("password") String password,
		HttpSession session,
		ModelMap modelMap) {
		//Driver name = driverRepo.findByUsernameAndPassword(username, password);
		Main name = userrepo.findByUsernameAndPassword(username, password);
		try {
		if(username.equalsIgnoreCase(name.getUsername()) && password.equalsIgnoreCase(name.getPassword())) {
			session.setAttribute("id", name.getId());
			session.setAttribute("Customerusername", username);
			session.setAttribute("Password", name.getPassword());
			session.setAttribute("Email", name.getEmail());
			session.setAttribute("Address", name.getAddress());
			session.setAttribute("Phone", name.getPhonenumber());
			session.setAttribute("City",name.getCity());
			session.setAttribute("State", name.getState());
			//session.setAttribute("DriverId", name.getDriverId());
			session.setAttribute("logged1", "yes");
			return "index";
		} }
		catch(NullPointerException e) {
			modelMap.put("error", "Invalid Credentials.Try to login with correct credentials!!");
			return "loginCustomer";
		}
		return "";
		
	}

	@RequestMapping(value = "logoutCustomer", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("Customerusername");
		session.removeAttribute("logged1");
		//session.removeAttribute("DriverId");
		return "index";
	}
	
	

}
