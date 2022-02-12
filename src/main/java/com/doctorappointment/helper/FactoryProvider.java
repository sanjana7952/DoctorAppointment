package com.doctorappointment.helper;
import java.io.PrintWriter;
import java.io.StringWriter;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		
		try {
			
			if(factory == null) {
				
			    factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory() ;
			}
			
			
		} catch (Exception e) {
			
			StringWriter sw = new StringWriter(); //object creation
			e.printStackTrace(new PrintWriter(sw)); //wrapping

	}
		return factory;
		
	}//end of getFactory() method
}
