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
<%@include file="components/message.jsp" %>
<%@include file="components/common_css_js.jsp" %>
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
	</div><br><br>
	
	<div class="row">
	     <div class="col md-10">
	         <% List<Patient> plist=(List) session.getAttribute("plist");
	       
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
				  
		       <% } 
		       %>
		  </div>
	</div>
</div>
</body>
</html>