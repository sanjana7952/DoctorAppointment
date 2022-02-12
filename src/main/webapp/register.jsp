<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body style="background-image:url('image/medi.jpg')"> 
	<div class="container">
        <div class="row">
            <div class="col-md-6 offset-3">
    
                <div class="card mt-4">
                    <div class="card-header custom-bg1 text-white">
                        <h3>New Doctor Registration</h3>
                    </div>
                    <div class="card-body">
                    <%@include file="components/message.jsp" %>
                        <form action="RegisterServlet" method="post">
                        
                            <div class="form-group">
								<label for="exampleInputEmail1">User Name</label> 
								<input type="text" name="username" class="form-control" id="username"
									aria-describedby="emailHelp" placeholder="Enter username" required="required">
							</div>
                            
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label> 
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1"
                                    placeholder="Password" required="required">
                            </div>

                            <div class="form-group">
								<label for="name">Name</label> 
								<input type="text" name="name" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter your name" required="required">
							</div>
            
                            <div class="container text-center mt-3">
                                <button type="submit" class="btn btn-primary custom-bg1 border-0">Submit</button>
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