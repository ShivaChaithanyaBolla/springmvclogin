package net.roseindia.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class NavigationController {
	@RequestMapping("home.html")
	public String home(){
	return "home";
	}
	
	@RequestMapping(value="room_booking.html", method=RequestMethod.POST)
	public String room(){
	return "loginsuccess";
	}
	@RequestMapping(value="room_booking.html", method=RequestMethod.GET)
	public String room1(){
	return "loginsuccess";
	}
	
}



