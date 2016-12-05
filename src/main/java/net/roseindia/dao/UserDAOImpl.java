package net.roseindia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.java.HibernateUtil;
import net.roseindia.model.ambulance_msg;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	

	@Override
	public boolean Insert_msg(String userName, String message) {
	 	   System.out.println("in DAO page");

		 Connection con;
			PreparedStatement preparedStatement = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO messages" +
					" (userName, Messages,status) VALUES (?,?,?) ";
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, message);
			preparedStatement.setInt(3, 0);

			preparedStatement.executeUpdate();

		    con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 

		return true;
 	   
    }

	@Override
	public ArrayList<AllAmbulanceMsgs> show_all_msg() {
		// TODO Auto-generated method stub
		
		
		
		 Connection con;
			PreparedStatement preparedStatement = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM messages";
			ResultSet r = stmt.executeQuery(sql);
			ArrayList<AllAmbulanceMsgs> allmsgs = new ArrayList<AllAmbulanceMsgs>();
			
			while(r.next()) {
				String userName = r.getString("userName");
				String Messages = r.getString("Messages");
				int status = r.getInt("status");
				AllAmbulanceMsgs al = new AllAmbulanceMsgs();
				al.setuname(userName);
				al.setmsg(Messages);
				al.setstatus(status);								
				allmsgs.add(al);
			}
			return allmsgs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}
}
