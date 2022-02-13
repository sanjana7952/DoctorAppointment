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
      private String adate;
	  
	  @ManyToOne
	  private Doctor doctor;

	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Patient(int pid, String pname, String pmobile, String adate, Doctor doctor) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pmobile = pmobile;
		this.adate = adate;
		this.doctor = doctor;
	}

	public Patient(String pname, String pmobile, String adate, Doctor doctor) {
		super();
		this.pname = pname;
		this.pmobile = pmobile;
		this.adate = adate;
		this.doctor = doctor;
	}

	public Patient(String pname, String pmobile, String adate) {
		super();
		this.pname = pname;
		this.pmobile = pmobile;
		this.adate = adate;
	}

	public Patient(String pname, String pmobile) {
		super();
		this.pname = pname;
		this.pmobile = pmobile;
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

	public String getPmobile() {
		return pmobile;
	}

	public void setPmobile(String pmobile) {
		this.pmobile = pmobile;
	}

	public String getAdate() {
		return adate;
	}

	public void setAdate(String adate) {
		this.adate = adate;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	@Override
	public String toString() {
		return "Patient [pid=" + pid + ", pname=" + pname + ", pmobile=" + pmobile + ", adate=" + adate + ", doctor="
				+ doctor + "]";
	}  
}
