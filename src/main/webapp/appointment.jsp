<%@page import="com.doctorappointment.dao.DoctorDao"%>
<%@page import="com.doctorappointment.helper.FactoryProvider"%>
<%@page import="com.doctorappointment.dao.PatientDao"%>
<%@page import="com.doctorappointment.entities.Doctor"%>
<%@page import="com.doctorappointment.entities.Patient"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="components/message.jsp" %>
<%@include file="components/common_css_js.jsp" %>
</head>

<body>
<%
     Doctor doctor= (Doctor)session.getAttribute("current_doctor");
     if(doctor==null){
    	 session.setAttribute("message","Not Logged-in ..Please Login First!!");
    	 response.sendRedirect("login.jsp");
    	 return;
     }
%>


<a href="LogoutServlet" style="float:right;" ><button class="btn btn-outline-danger my-2 my-sm-0">Log-Out</button></a>


<div class="container text-center">
    <br><h1>Appointment List</h1><br><hr><br><br>
	<div class="row">
	    <div class="col">
	       <form action="AppointmentServlet" method="post">
	          <input type="hidden" name="oprt" value="getAppointmentDetails">
	          Date <input type="date" id="dateInput" name="date">
	          <input type="submit" value="Search">
	       </form>
	    </div>
	    
	    <form method="post" action="AppointmentServlet">
	         <input type="hidden" name="oprt" value="destroyPlist">
	         <input class="btn btn-outline-primary" type="submit" value="Get Today's Appointment List">
	    </form>
	    
	    
	    
	</div><br><br>
	
	<div class="row">
	     <div class="col md-10">
	         <% 
	            PatientDao pdao=new PatientDao(FactoryProvider.getFactory());
	            List<Patient> plist=(List) session.getAttribute("plist");
	            List<Patient> tplist= pdao.getCurrentDatePatients(doctor.getDid());
	       
		       if(plist!=null){ %>
		    	  <table class="table table-dark">
					  <tr>
					    <th>Patient Name</th>
					    <th>Patient Mobile</th>
					    <th>Date</th>
					  </tr>
					  
					 <% for(Patient p: plist) {  %>
					  <tr>
					    <td><%=p.getPname() %></td>
					    <td><%=p.getPmobile() %></td>
					    <td><%=p.getAdate()%></td>
					  </tr>
					 <% } %> 
				 </table>  
				  
		       <% }else if(tplist!=null){   %>
		    	   
		    	   <table class="table table-dark">
					  <tr>
					    <th>Patient Name</th>
					    <th>Patient Mobile</th>
					    <th>Date</th>
					  </tr>
					  
					 <% for(Patient p: tplist) {  %>
					  <tr>
					    <td><%=p.getPname() %></td>
					    <td><%=p.getPmobile() %></td>
					    <td><%=p.getAdate()%></td>
					  </tr>
					 <% } %> 
				 </table>  
   
		       <% }else { 
		    	   System.out.println("**********both plist and tplist are null********");
		       } %>
		  </div>
	</div>
</div>
</body>
</html>