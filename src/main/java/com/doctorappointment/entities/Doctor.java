package com.doctorappointment.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Doctor {
       
	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   private int did;
	   
	   private String dname;
	   
	   private String dusername;
	   
	   private String dpassword;
	
	   
	   @OneToMany(mappedBy = "doctor")
	   private List<Patient> plist;

	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Doctor(int did, String dname, String dpassword, String dusername, List<Patient> plist) {
		super();
		this.did = did;
		this.dname = dname;
		this.dpassword = dpassword;
		this.dusername = dusername;
		this.plist = plist;
	}

	public Doctor(String dname, String dpassword, String dusername, List<Patient> plist) {
		super();
		this.dname = dname;
		this.dpassword = dpassword;
		this.dusername = dusername;
		this.plist = plist;
	}
	
	public Doctor(String dname, String dusername, String dpassword) {
		super();
		this.dname = dname;
		this.dusername = dusername;
		this.dpassword = dpassword;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDpassword() {
		return dpassword;
	}

	public void setDpassword(String dpassword) {
		this.dpassword = dpassword;
	}

	public String getDusername() {
		return dusername;
	}

	public void setDusername(String dusername) {
		this.dusername = dusername;
	}

	public List<Patient> getPlist() {
		return plist;
	}

	public void setPlist(List<Patient> plist) {
		this.plist = plist;
	}

	@Override
	public String toString() {
		return "Doctor [did=" + did + ", dname=" + dname + ", dpassword=" + dpassword + ", dusername=" + dusername
				+ ", plist=" + plist + "]";
	}
  	
}
