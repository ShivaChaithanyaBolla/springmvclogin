package net.roseindia.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.model.*;

public interface UserService{    
   	public boolean Insert_msg(String userName,String message);

	public ArrayList<AllAmbulanceMsgs> show_all_msg();

}