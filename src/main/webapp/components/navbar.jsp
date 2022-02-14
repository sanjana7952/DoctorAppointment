<%@page import="com.doctorappointment.entities.Patient"%>
<%@page import="com.doctorappointment.entities.Doctor"%>
<html>
<head>

<style type="text/css">

#nav1
{  
    background-color: black; /*whichever you want*/
    opacity: 0.9; 
    filter:(opacity=30);       
}

</style>


</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark " id="nav1">
	
    <div class="container-fluid tra">
        <!-- <a class="navbar-brand" href="#">Brand</a> -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>
               
              </ul>  
                <%
   				 Doctor doctor1= (Doctor)session.getAttribute("current_doctor");
				 Patient patient1 = (Patient)session.getAttribute("current_patient");
				 
				 if(doctor1==null && patient1 == null){
				 
				 %>
				 <ul class="navbar-nav ml-auto">
					  <li class="nav-item">
                	<a href="login.jsp" class="btn btn-success my-2 my-sm-0">Log-in</a>&nbsp;
              
                </li>
                
                 <li class="nav-item">
                	<a href="register.jsp" class="btn btn-success my-2 my-sm-0">Register</a>
              
                </li>
				 
				 </ul>
				 
				<%  }
				 
				 
				 else if(doctor1!=null){
				%>
				<ul class="navbar-nav ml-auto">
                <li class="nav-item text-white">
						 <a class="nav-link active" href="appointment.jsp">Welcome <%=doctor1.getDname() %>&nbsp;&nbsp;</a>
                </li>
                <li class="nav-item">
                	
                	<form method="post" action="AppointmentServlet">
					         <input type="hidden" name="oprt" value="destroyPlist">
					         <input class="btn btn-primary" type="submit" value="Get Today's Appointment List">&nbsp;
				   </form>
				              
                </li>
                <li class="nav-item">
                	<a href="LogoutServlet" class="btn btn-danger my-2 my-sm-0">Log-Out</a>
              
                </li>
                 </ul> 
                <% } else if(patient1!=null){ %>
                <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                	<a class="nav-link active" href="bookappointment.jsp">Welcome <%= patient1.getPname() %>&nbsp;&nbsp;</a>
                </li>
                <li class="nav-item">
                	<a href="LogoutServlet" class="btn btn-danger my-2 my-sm-0">Log-Out</a>
                </li>
                
                <% } %>
           </ul>
           
        </div>
    </div>
</nav>


</body>
</html>