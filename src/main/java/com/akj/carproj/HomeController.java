package com.akj.carproj;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.akj.carproj.dao.CustomerRepo;
import com.akj.carproj.dao.IdRepo;
import com.akj.carproj.dao.MainDao;
import com.akj.carproj.dao.UserRepo;
import com.akj.carproj.model.Customer;
import com.akj.carproj.model.IdMain;
import com.akj.carproj.model.Main;
import com.akj.carproj.service.CustomerService;
import com.akj.carproj.service.MainService;


@Controller
public class HomeController {

	@Autowired
	MainDao mainDao;
	
	@Autowired
	CustomerRepo repo;

	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	IdRepo idrepo;
	
	@Autowired
	UserRepo userrepo;
	
	@RequestMapping(value={"/","/index"})
	public String home()
	{
		return "index";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@PostMapping("/save-user") 
	public String register(@ModelAttribute Main user,BindingResult bindingresult,HttpServletRequest request) {
		System.out.println("post saveuser called");
		mainDao.saveMyUser(user);
		//request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@PostMapping("/customer-data")
	public String customerData(@ModelAttribute Customer a,@ModelAttribute IdMain b) {
		System.out.println("post called");
		repo.save(a);
		idrepo.save(b);
		//return "CustomerFinal";
		return "Spinner";
	}
	
	@PostMapping("/update") 
	public Customer update(@ModelAttribute Customer a) { 
		System.out.println("update called");
		return repo.save(a);
	}
	 
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		customerService.delete(id);
		System.out.println(id);
		return "redirect:/index";
	}
	
	@RequestMapping("/currentRide")
	public String current() {
		return "CurrentRide";
	}
	
	@RequestMapping("/customer-data")
	public String spinner() {
		return "Spinner";
	}
	
	@RequestMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	@RequestMapping("/landing")
	public String main()
	{
		return "landing";
	}
	
	@RequestMapping("/cosdriv")
	public String cosdriv()
	{
		return "cosdriv";
	}
	
	@RequestMapping("/newPayment")
	public String newPayment()
	{
		return "newPayment";
	}
	
	@RequestMapping("/driverPayment")
	public String driverPayment() {
		return "driverPayment";
	}
	
	
	@RequestMapping("/driver")
	public String driver()
	{
		return "DriverHome";
	}
	
	@RequestMapping("/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	/*
	 * @RequestMapping("/login") public String login() { return "login"; }
	 */
	@RequestMapping("/loginIndex")
	public String loginIndex() {
		return "loginIndex";
	}
	
	

	@RequestMapping("/loginDriver")
	public String loginDriver() {
		return "loginDriver";
	}
	
	@RequestMapping("/review")
	public String review() {
		return "review";
	}
	
	@RequestMapping("/book")
	public String book() {
		return "redirect:#book";
	}
	
	@PostMapping("/customer-ride")
	public String customerFinal() {
		return "CustomerFinal";
	}
	@PostMapping("/CustomerFinalEvent") 
	public String drivCus(){
		System.out.println("start called");
		return "CustomerFinal";
	}
	@RequestMapping("/rough")
	public String rough()
	{
		return "rough";
	}
	
	@RequestMapping("/DriverFinal")
	public String spin() {
		return "DriverFinal";
	}
	
	@RequestMapping("/completeRide")
	public String completeRide() {
		return "completeRide";
	}
	@RequestMapping("/CustomerFinal")
	public String customer() {
		return "CustomerFinal";
	}
	
	
	

	
		
}
