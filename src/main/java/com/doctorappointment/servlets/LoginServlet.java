package com.doctorappointment.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctorappointment.dao.DoctorDao;
import com.doctorappointment.entities.Doctor;
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
		            
		    	 		response.sendRedirect("appointment.jsp");
		     }

            
		} catch (Exception e) {
			e.printStackTrace();
			 
		}
        
		doGet(request, response);
	}

}
