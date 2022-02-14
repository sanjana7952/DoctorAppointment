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
<%@include file="components/navbar.jsp" %>


<style>

h1{

color: white;

background-color:#333;

text-align: center;

}

 

 

h3{

color: black;

 

}

 

button{

position:absolute;

right:600px;

 

 

}

 

.card{

border-radius:20%;

padding-top:60px;

width: 400px;

border-color: #6AC1D4;

border-width:medium;

margin-left:350px;

 

}

.card-header{

 

background-color: #6AC1D4;

border-radius:;

 

}

 


</style>

</head>
<body style="background-image:url('https://thumbs.dreamstime.com/z/concept-appointment-to-doctor-online-top-view-wooden-background-83320913.jpg');

background-repeat: no-repeat;

height: auto;

 max-width: 100%;

 background-size:cover ;

background-attachment: fixed;

overflow:; ">



<%
     Patient patient= (Patient)session.getAttribute("current_patient");
     if(patient==null){
    	 session.setAttribute("message","Not Logged-in ..Please Login First!!");
    	 response.sendRedirect("login.jsp");
    	 return;
     }
%>
 
<% Patient p=(Patient) session.getAttribute("current_patient"); %>



<h1><b> Book Your Appointment</b></h1>

	<%
	DoctorDao ddao = new DoctorDao(FactoryProvider.getFactory());
	List<Doctor> dlist = ddao.getDoctorsList();
	%>
	
<div class="container text-center">

       <div class="card mt-5 text-center">

       <div class="card-header custom-bg1 text-white text-center ">	
			
			<h4 class="text-center"><b>Doctor Name</b></h4>
		</div>
<form action="AppointmentServlet" method="post">
    
    <input type="hidden" name="oprt" value="bookAppointment" >
    
	<div class="form-group text-center">
	  <select name="doctor">
	      <% for(Doctor d: dlist){ %>
	          <option value="<%=d.getDid()%>"> <%=d.getDname()%> </option> 
	      <% }  %>
	 </select>
    </div>
  
    <h4 class="text-center"><b>Date</b> </h4>
      <input type="date" id="dateInput" name="date" class="text-center">
      
      <div class="container  mt-3 ">
      
      <button type="submit" class="btn btn-primary">Submit</button>
      
      </div>
      
</form> 

</div>
</div>
</body>
</html>
