<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp" %>

<style>
.card-header{

background-color: #6AC1D4;
border-radius:;

}
button{
background-color: #6a8cd4;
}
.card{
border-radius:20%;
padding-top:60px;
width: 400px;
border-color: #6AC1D4;
border-width:medium;
}


</style>

</head>
<body style="background-image:url('https://media.istockphoto.com/photos/doctor-writing-a-medical-prescription-picture-id1319031310?b=1&k=20&m=1319031310&s=170667a&w=0&h=crYyw4Jk5naigYVJEALChMZoAeld_kjaoIpNIaAnCZQ=');
background-repeat: no-repeat;
height: auto; 
 max-width: 100%; 
 background-size:cover ;
background-attachment: fixed; 
overflow:; ">
			<div class="container">
		<div class="row">
			<div class="col-md-4 offset-1">

				<div class="card mt-5 offset-position: left;">
					<div class="card-header custom-bg1 text-white">
						<h3 class="text-center"><b>Doctors Login</b> <span><i class="fas fa-stethoscope Logo-small"></i></span></h3>
						
					</div>
					<div class="card-body">
						<%@include file="components/message.jsp" %>
						<form action="LoginServlet" method="post">
						
						   <input type="hidden" name="op" value="doctor" >
						
							<div class="form-group">
								<label for="exampleInputEmail1">User name</label> 
								<input type="text" name="username" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input name="password" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required">
							</div>
			
							<div class="container text-center mt-3">
								<button type="submit" class="btn btn-primary custom-bg1 border-0">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg1 border-0">Reset</button>
							</div>
							<br>
							
							<a href="register.jsp" class="text-center d-block "> <b>REGISTER</b></a>
							
						</form>

					</div>
					
				</div>

			</div>
			<!-- end of card -->
            <div class="col-md-4 offset-2">

				<div class="card mt-5 offset-position: left;">
					<div class="card-header custom-bg1 text-white">
						<h3 class="text-center"><b>Patients Login</b> <span><i class="fas fa-hospital-user Logo-small"></i></span></h3>
					</div>
					<div class="card-body">
						<form action="LoginServlet" method="post">
						
						    <input type="hidden" name="op" value="patient">
						
							<div class="form-group">
								<label for="name">Name</label> 
								<input type="text" name="name" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter your name" required="required">
							</div>
							
							<div class="form-group">
								<label for="phone">Mobile</label> 
								<input name="mobile" type="number" class="form-control" id="phone"
									placeholder="Enter your number" req>
							</div>
							<div class="container text-center mt-3">
								<button type="submit" class="btn btn-primary custom-bg1 border-0">Proceed</button>
								<button type="reset" class="btn btn-primary custom-bg1 border-0">Reset</button>
							</div>
							<br>			
						</form>

					</div>
					
				</div>

			</div>
		</div>
	</div>
</body>
</html>