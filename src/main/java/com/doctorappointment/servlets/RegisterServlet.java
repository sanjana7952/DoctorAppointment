package com.doctorappointment.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.doctorappointment.dao.DoctorDao;
import com.doctorappointment.entities.Doctor;
import com.doctorappointment.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		  
		try {
            PrintWriter out = response.getWriter();
			
			String Dname = request.getParameter("name");
			String Dusername = request.getParameter("username");
			String Dpassword = request.getParameter("password");
			
			Doctor doctor = new Doctor(Dname, Dusername, Dpassword);
			
			DoctorDao doctorDao = new DoctorDao(FactoryProvider.getFactory()); 
			
			Doctor d=doctorDao.getDoctorByUsername(Dusername);
			
			if(d!=null) {
                HttpSession httpsession = request.getSession();
            	
            	httpsession.setAttribute("message","User name already exists , please use different one");

                response.sendRedirect("register.jsp");

                return;
			}else {
				Session hibernateSession = FactoryProvider.getFactory().openSession();
    			Transaction txn = hibernateSession.beginTransaction();
    			hibernateSession.save(doctor);
    			txn.commit();
    			hibernateSession.close();
    			
    			
    			response.sendRedirect("login.jsp");
    			return;
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
