package net.roseindia.controllers;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
/*
@Author: Deepak Kumar
Check more tutorials at http://www.roseindia.net
*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.roseindia.form.AmbulanceForm;
import net.roseindia.form.LoginForm;
import net.roseindia.java.*;
import net.roseindia.model.ambulance_msg;
import net.roseindia.service.LoginService;
import net.roseindia.service.UserService;



@Controller
public class MessageController {
	
	@Autowired
	public UserService userService;

	
	@RequestMapping("messageForm.html")
	public String home(){
	return "messagepage";
	}
	
	@RequestMapping(value="sendm.html", method = RequestMethod.POST)
	public String homne(@ModelAttribute AmbulanceForm ambulanceForm,BindingResult result, Map model){

	boolean ss = userService.Insert_msg(ambulanceForm.getUserName(), ambulanceForm.getmessage());
	 System.out.println(ss);
		return "ambulance";
	}

	@RequestMapping("appointments.html")
	public String homne(){
		
	//	fit obj=new fit();
	//	obj.call();
	return "calendar";
	}
	@RequestMapping(value="sendm.html", method = RequestMethod.GET)
	public String ho(Map model){
		
	//	fit obj=new fit();
	//	obj.call();
		AmbulanceForm ambulanceForm = new AmbulanceForm();
		model.put("ambulanceForm", ambulanceForm);
	return "ambulance";
	}
	

}
