<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp" %>


<style type="text/css">
    .card{
    border-radius:20%;
    padding-top:60px;
    width: 400px;
    background-color: #acd6d5    /* rgba(2,2,5,0.2) */;


    }
    .card-header{
    border-radius:40%;
    }


    h3{
    color:black;
    text-decoration: underline;

    }

</style>


</head>
<body style="background-image:url('image/registerdoc.jpg');
    background-repeat: no-repeat;
    height: 100%; 
    width: 100%; 
    margin-left:300px;
    background-size: cover;
    background-attachment: fixed; 
    overflow: hidden; "> 
	<div class="container">
        <div class="row">
            <div class="col-md-6 offset-3">
    
                <div class="card mt-4">
                    <div class="card-header text-center">
                        <h3><b>New Doctor Registration</b></h3>
                    </div>
                    <div class="card-body">
                    <%@include file="components/message.jsp" %>
                        <form action="RegisterServlet" method="post">
                        
                            <div class="form-group">
								<label for="exampleInputEmail1"><i><b>User Name :</b></i></label> 
								<input type="text" name="username" class="form-control" id="username"
									aria-describedby="emailHelp" placeholder="Enter username" required="required">
							</div>
                            
                            <div class="form-group">
                                <label for="exampleInputPassword1"><i><b>Password :</b></i></label> 
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1"
                                    placeholder="Password" required="required">
                            </div>

                            <div class="form-group">
								<label for="name"><i><b>Name :</b></i></label> 
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