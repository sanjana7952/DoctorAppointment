package com.doctorappointment.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.doctorappointment.entities.Doctor;

public class DoctorDao {
	
private SessionFactory factory;
	
 public DoctorDao(SessionFactory factory) {

    super();

    this.factory = factory;

 }
	
public Doctor getDoctorByUserNameAndPassword(String username,String password) {

       Doctor d=null;

        try {

               String query = "from Doctor where dusername= :e and dpassword= :p";
               Session session = this.factory.openSession();
               Query q=session.createQuery(query);
               q.setParameter("e",username);
               q.setParameter("p", password);
               d = (Doctor) q.uniqueResult();
               session.close();

        }catch(Exception e) {

               e.printStackTrace();

        }
        
        return d;
}
	
public Doctor getDoctorByUsername(String username) {
	
	 Doctor d=null;  
     try {
             String query = "from Doctor where dusername= :e";
             Session session = this.factory.openSession();
             Query q=session.createQuery(query);
             q.setParameter("e",username);
             d = (Doctor) q.uniqueResult();
             session.close();

      }catch(Exception e) {
             e.printStackTrace();
      }
     
      return d;
}
 
 
	
public List<Doctor> getDoctorsList() {	
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Doctor");
		List<Doctor> resultList = query.getResultList();
		session.close();
		return resultList;
}
	
}
