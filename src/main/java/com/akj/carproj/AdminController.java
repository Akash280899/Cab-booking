package com.akj.carproj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.akj.carproj.dao.AdminRepo;
import com.akj.carproj.dao.DriverRepo;
import com.akj.carproj.dao.EmpDao;
import com.akj.carproj.model.Admin;
import com.akj.carproj.model.Customer;
import com.akj.carproj.model.Driver;
import com.akj.carproj.model.IdMain;
import com.akj.carproj.model.Main;
import com.akj.carproj.service.CustomerService;
import com.akj.carproj.service.DriverService;

@Controller
public class AdminController {
	
	@Autowired
	AdminRepo adminrepo;
	
	@Autowired
	DriverRepo repo;
	
	@Autowired
	DriverService driverService;
	
	@RequestMapping("/loginAdmin")
	public String loginIndex() {
		return "loginAdmin";
	}
	
	@PostMapping("/driver-data")
	public String driverData(@ModelAttribute Driver a) {
		repo.save(a);
		return "admin";
	}
	
	@RequestMapping(value = "delete-driver", method = RequestMethod.POST)
	public String delete(@RequestParam("driverId1") int driverid) {
		driverService.deleteAllByDriverId(driverid);
		return "admin";
	}
	
	@RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)
	public String loginAdmin(
		@RequestParam("username") String username,
		@RequestParam("password") String password,
		HttpSession session,
		ModelMap modelMap) {
		Admin name = adminrepo.findByUsernameAndPassword(username, password);
		try {
		if(username.equalsIgnoreCase(name.getUsername()) && password.equalsIgnoreCase(name.getPassword())) {
			session.setAttribute("Adminusername", username);
			session.setAttribute("AdminPassword", name.getPassword());
			session.setAttribute("logged2", "yes");
			return "admin";
		} }
		catch(NullPointerException e) {
			modelMap.put("error", "Invalid Credentials.Try to login with correct credentials!!");
			return "loginAdmin";
		}
		return "";
		
	}

	@RequestMapping(value = "logoutAdmin", method = RequestMethod.GET)
	public String logoutAdmin(HttpSession session) {
		session.removeAttribute("Adminusername");
		session.removeAttribute("logged2");
		return "admin";
	}
	
	

}
