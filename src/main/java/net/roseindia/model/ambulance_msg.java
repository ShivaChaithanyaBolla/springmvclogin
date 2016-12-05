
package net.roseindia.model;
import java.util.List;
import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.persistence.Embeddable;

@Entity
@Table(name = "messages")
@SuppressWarnings("serial")
public class ambulance_msg implements Serializable {


	@Column(name = "userName")
	String userName;

	@Column(name = "Messages")
	String message;


	public String getuserName() {
		return userName; 
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	
	public String getmessage() {
		return message;
	}
	
	public void setmessage(String message) {
		this.message = message;
	}
}