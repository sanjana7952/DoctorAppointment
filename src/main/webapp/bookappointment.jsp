<%@page import="com.doctorappointment.entities.Patient"%>
<%@page import="com.doctorappointment.entities.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.doctorappointment.helper.FactoryProvider"%>
<%@page import="com.doctorappointment.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="components/common_css_js.jsp" %>

</head>
<body style="background-image:url('image/medi.jpg')"> 

<a href="LogoutServlet" style="float:right;" ><button class="btn btn-outline-danger my-2 my-sm-0">Log-Out</button></a>

<%
     Patient patient= (Patient)session.getAttribute("current_patient");
     if(patient==null){
    	 session.setAttribute("message","Not Logged-in ..Please Login First!!");
    	 response.sendRedirect("login.jsp");
    	 return;
     }
%>
 
<% Patient p=(Patient) session.getAttribute("current_patient"); %>


<h1> Book Your Appointment - <%=p.getPname()%></h1>

	<%
	DoctorDao ddao = new DoctorDao(FactoryProvider.getFactory());
	List<Doctor> dlist = ddao.getDoctorsList();
	%>
	
<%@include file="components/message.jsp" %>
<h4>Doctor Name</h4>
<form action="AppointmentServlet" method="post">
    
    <input type="hidden" name="oprt" value="bookAppointment" >
    
	<div class="form-group">
	  <select name="doctor">
	      <% for(Doctor d: dlist){ %>
	          <option value="<%=d.getDid()%>"> <%=d.getDname()%> </option> 
	      <% }  %>
	 </select>
    </div>
  
    <h4>Date </h4>
      <input type="date" id="dateInput" name="date">
      <button type="submit" class="btn btn-primary">Submit</button>
      
</form> 
</body>
</html>
