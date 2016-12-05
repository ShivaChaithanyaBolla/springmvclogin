package net.roseindia.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.roseindia.dao.AmbulanceDAO;
import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.AmbulanceForm;
import net.roseindia.form.LoginForm;
import net.roseindia.model.ShowMessage;
import net.roseindia.model.Users;
import net.roseindia.model.ambulance_msg;
import net.roseindia.service.LoginService;
import net.roseindia.service.UserService;


@Controller
public class AmbulanceController {

	
	@Autowired
	public UserService userService;

	 
	@RequestMapping("Ambulance1.html")
	public String ambulance(Map m){
		


		ArrayList<AllAmbulanceMsgs> ss = userService.show_all_msg();
		for (AllAmbulanceMsgs p : ss)
		    System.out.println("point x: " + p.getuname()+" "+p.getmsg()+" "+p.getstatus());
		m.put("ss", ss);
		/*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("ambulance.xml");
		
		
		ShowMessage sm = new ShowMessage();
		sm.setMessage("akjdbajkdkjabs");
		sm.setUserName("asdhas");
	
		
		ambulanceDAO.save(sm);
		System.out.println("Person::"+sm);
				*/

		return "AmbToSdMsg";
	}
}
