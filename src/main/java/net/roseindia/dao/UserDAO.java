package net.roseindia.dao;
import java.util.ArrayList;

import net.roseindia.form.AllAmbulanceMsgs;
/*
@Author: Deepak Kumar
Check more tutorials at http://www.roseindia.net
*/
import net.roseindia.model.*;

public interface UserDAO{    
   	public boolean Insert_msg(String userName,String message);

	public ArrayList<AllAmbulanceMsgs> show_all_msg();

}