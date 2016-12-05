package net.roseindia.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class ServiceDeskController {

	@RequestMapping(value="SDacknowledge.html")
	public String room1(){
	return "home";
	}
	
	
}
