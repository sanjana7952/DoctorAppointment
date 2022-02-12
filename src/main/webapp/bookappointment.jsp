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
<div class="container text-center">
	<h1> Book Appointment </h1>
	<%
	DoctorDao ddao = new DoctorDao(FactoryProvider.getFactory());
	List<Doctor> dlist = ddao.getDoctorsList();
	%>
	<div class="card">
	<div class="row text-center mt-5">
	<div class="col-sm-6 offset-4">
		<div class="row">
		
			<div class="col-sm-4 offset-2">
			
				<h4>Doctor Name</h4>

			</div>
			
			<div class="col-sm-1">
			
				<select>
	           	  <%
	           		for(Doctor d: dlist){		
	   	           	%>
	           		<option value="<%=d.getDid() %>"> <%=d.getDname()%> </option>	
	       			<% } 	
	       			%>
	          
     			</select>
			</div>
			
		</div><!-- end of row 1 -->
	 
	    <div class="row">
	    	<div class="col-sm-6 ">
	    	
	    	<h4>Date </h4>
	    	</div>
	       
	       <div class="col-sm-6">
	       
	       <input type="datetime-local" id="Test_DatetimeLocal">
	       
	       </div>
	    	
	    </div>
	
	</div>
	</div>
	
	
	
</div>	
</div>
</body>
</html>