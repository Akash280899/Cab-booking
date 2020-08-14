package com.akj.carproj.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.akj.carproj.model.Main;
@Service
public class EmpDao {
	JdbcTemplate template; 
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {    
	    this.template = template;    
	}    
	public int update(Main p){   
	    String sql="update carproj set username='"+p.getUsername()+"', email='"+p.getEmail()+"',password='"+p.getPassword()+"',address='"+p.getAddress()+"',phonenumber='"+p.getPhonenumber()+"' ,city='"+p.getCity()+"',state='"+p.getState()+"' where id="+p.getId()+"";    
	    return template.update(sql); 
	}    
}
