package com.doctorappointment.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.doctorappointment.dao.DoctorDao;
import com.doctorappointment.entities.Doctor;
import com.doctorappointment.entities.Patient;
import com.doctorappointment.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String op=request.getParameter("op");
		
		if(op.trim().equals("doctor")) {
    
	        try {
	        	String dusername = request.getParameter("username");
	
	            String dpassword= request.getParameter("password");
	            
	            DoctorDao doctorDao = new DoctorDao(FactoryProvider.getFactory()); 
	       
	            Doctor d = doctorDao.getDoctorByUserNameAndPassword(dusername, dpassword);
	            
	            HttpSession session = request.getSession();
	            
	            if(d==null) {
	                session.setAttribute("message","Invalid credentials..!!");
	
	                response.sendRedirect("login.jsp");
	
	                return;
	
			     }else { 			            
			    	 session.setAttribute("current_doctor", d);  ////////////////
			    	 response.sendRedirect("appointment.jsp");
			     }
	
	            
			} catch (Exception e) {
				e.printStackTrace();
				 
			}
	        
	
		}else if(op.trim().equals("patient")) {
			
			 String pname=request.getParameter("name");
			 String pmobile=request.getParameter("mobile");
			 
			 Patient p=new Patient(pname, pmobile);
			 Session hibernateSession = FactoryProvider.getFactory().openSession();
 			 Transaction txn = hibernateSession.beginTransaction();
 			 hibernateSession.save(p);
 			 txn.commit();
 			 
 			 
 			 Patient currPatient=new Patient();
 			 String query = "from Patient where pname = :n and pmobile= :m";
 			 Query q=hibernateSession.createQuery(query);
 			 q.setParameter("n",pname);
 			 q.setParameter("m",pmobile);
 			 currPatient=(Patient) q.uniqueResult();
 			 hibernateSession.close();

 			HttpSession session = request.getSession();
 			session.setAttribute("current_patient",currPatient);  /////////////////////
 			response.sendRedirect("bookappointment.jsp");
 			return;
 			
		}else {
			
			HttpSession session = request.getSession();
 			session.setAttribute("message","Invalid user !!");
 			response.sendRedirect("login.jsp");
 			return;
		}
	
   }
}


