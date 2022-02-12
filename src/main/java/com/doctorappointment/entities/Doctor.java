package com.doctorappointment.entities;

import java.util.ArrayList;
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
	   
	   private String dpassword;
	   
	   private String dusername;
	   
	   @OneToMany(mappedBy = "doctor")
	   private List<Patient> patient = new ArrayList<Patient>();

		public Doctor(List<Patient> patient) {
		super();
		this.patient = patient;
		}

		public List<Patient> getPatient() {
		return patient;
		}

		public void setPatient(List<Patient> patient) {
			this.patient = patient;
		}

		public Doctor() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Doctor(int did, String dname, String dpassword, String dusername) {
			super();
			this.did = did;
			this.dname = dname;
			this.dpassword = dpassword;
			this.dusername = dusername;
		}

		public Doctor(String dname, String dpassword, String dusername) {
			super();
			this.dname = dname;
			this.dpassword = dpassword;
			this.dusername = dusername;
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

		@Override
		public String toString() {
			return "Doctor [did=" + did + ", dname=" + dname + ", dpassword=" + dpassword + ", dusername=" + dusername
					+ ", patient=" + patient + "]";
		}
			   
}
