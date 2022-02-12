package com.doctorappointment.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Patient {
	
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private int pid;
	  
	  private String pname;
      private String pmobile;
	  
	  @ManyToOne
	  private Doctor doctor;
	  
    public Doctor getDoctor() {
	    return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Patient(Doctor doctor) {
		super();
		this.doctor = doctor;
	}
      
	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Patient(int pid, String pname, String mobile) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pmobile = mobile;
	}

	public Patient(String pname, String mobile) {
		super();
		this.pname = pname;
		this.pmobile = mobile;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getMobile() {
		return pmobile;
	}

	public void setMobile(String mobile) {
		this.pmobile = mobile;
	}

	@Override
	public String toString() {
		return "Patient [pid=" + pid + ", doctor=" + doctor + ", pname=" + pname + ", mobile=" + pmobile + "]";
	}
   
}
