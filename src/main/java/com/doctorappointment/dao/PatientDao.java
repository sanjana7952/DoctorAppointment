package com.doctorappointment.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.doctorappointment.entities.Doctor;
import com.doctorappointment.entities.Patient;
import com.doctorappointment.helper.FactoryProvider;

import java.util.List;

public class PatientDao {
   
 private SessionFactory factory;
	
 public PatientDao(SessionFactory factory) {

    super();

    this.factory = factory;

 }
 
 public boolean addAppointment(int pid, int did,String date){
	 
	 Session session=this.factory.openSession();
	 Transaction transaction = session.beginTransaction();
	 
	 String query = "update Patient as p set p.doctor.did =:did, adate =:date where p.pid =:pid";
	 Query q=session.createQuery(query);
	 q.setParameter("did",did);
	 q.setParameter("date",date);
	 q.setParameter("pid",pid);
	 int count=q.executeUpdate();
	 
	 transaction.commit();
	 session.close();
	 
	 if(count!=0) {
		 return true;
	 }else {
		 return false;
	 }
 }

 public List<Patient> getPatientsList(int did, String date) {
	 
	 List<Patient> plist=null;
	 
	 String query = "from Patient as p where p.doctor.did = :did and adate= :date";
     Session session = this.factory.openSession();
     Query<Patient> q=session.createQuery(query);
     q.setParameter("did",did);
     q.setParameter("date",date);
     plist=q.getResultList();
     session.close();
     
	 return plist;
 }
 
 public List<Patient> getCurrentDatePatients(int did){
	 List<Patient> todayPatientsList=null;
	 DoctorDao ddao = new DoctorDao(FactoryProvider.getFactory());
	 String date=ddao.getCurrentDate();
	 
	 
		
      String query =
		  "from Patient as p where p.doctor.did = :did and adate= :date";

          Session session = this.factory.openSession();
		  Query<Patient> q=session.createQuery(query); 
		  q.setParameter("did",did);
		  q.setParameter("date",date);
		  todayPatientsList=q.getResultList();
		  session.close();	
     
	      return todayPatientsList; 
 } 
 
}
