package com.doctorappointment.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctorappointment.dao.PatientDao;
import com.doctorappointment.entities.Doctor;
import com.doctorappointment.entities.Patient;
import com.doctorappointment.helper.FactoryProvider;

/**
 * Servlet implementation class AppointmentServlet
 */
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServlet() {
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
		
		String op=request.getParameter("oprt");
		
		if(op.trim().equals("bookAppointment")) {
			  
			try {
				
				int did = Integer.parseInt(request.getParameter("doctor"));
				String date = request.getParameter("date").trim();
				
				HttpSession session=request.getSession();
				Patient patient=(Patient) session.getAttribute("current_patient");
				int pid=patient.getPid();
				
				PatientDao pdao=new PatientDao(FactoryProvider.getFactory());
				boolean flag = pdao.addAppointment(pid ,did, date);
                
				if(flag==true) {
					session.setAttribute("message", "Appointment booked successfully !!!");
					response.sendRedirect("bookappointment.jsp");
				}else {
					session.setAttribute("message", "Error ..Failed to book appoinment !! ");
					response.sendRedirect("bookappointment.jsp");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(op.trim().equals("getAppointmentDetails")) {
			
			 String date= request.getParameter("date").trim();
			 
			 
			 HttpSession Httpsession=request.getSession();
			 Doctor doctor= (Doctor) Httpsession.getAttribute("current_doctor");
			 int did=doctor.getDid();
			 
			 
			 try {
				 
				 PatientDao pdao=new PatientDao(FactoryProvider.getFactory());
				 List<Patient> plist=pdao.getPatientsList(did,date);
				 
				 if(plist!=null)
				 {
					 Httpsession.setAttribute("plist", plist);
					 response.sendRedirect("appointment.jsp");
					 return;
				 }else {
					 Httpsession.setAttribute("message", "No appointments on "+date);
					 response.sendRedirect("appointment.jsp");
				 }
				  
			 }catch(Exception e){
				 e.printStackTrace();
			 }
			 
		}else if(op.trim().equals("destroyPlist"))
		{
			 HttpSession session=request.getSession();
			 session.removeAttribute("plist");
			 response.sendRedirect("appointment.jsp");
			 
		}
		else {
			 HttpSession Httpsession=request.getSession();
			 Httpsession.setAttribute("message", "ERROR !!");
			 response.sendRedirect("index.jsp");
			 return;
		}
		
	}

}
