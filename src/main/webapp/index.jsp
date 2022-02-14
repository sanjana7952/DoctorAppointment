<html>
<head>
<%@include file="components/common_css_js.jsp" %>
<style type="text/css">

.container{  
text-align: center;    
width: 300px;  
height: 200px;  
padding-top: 200px;  
}  


#btnone{

border-radius:10px;
position:absolute;
top:200px;
left:100px


}
#btntwo
{
border-radius:10px;
position:absolute;
top:200px;
left:200px

}

body{

text-align: center;
color: white;
font-family: cursive;

}

</style>
</head>


<body style="background-image:url('image/meet-your-doctor.jpg');
	background-repeat: no-repeat;
	height: 100%; 
	width: 100%; 
	background-size: cover;
	background-attachment: fixed; 
	overflow: hidden; /* Hide scrollbars */">


<%@include file="components/navbar.jsp" %>

<marquee direction="left" scrollamount="9"><b>
We will be out of service for 14th and 15th of March in the event of Holi. Emergency services will be available. Call 99234568 , 77356383. Get service at your Doorstep. Thankyou!</b>


</marquee>



  <div class="container text-center mt-5">
  
  <button id="btnone"  class="btn btn-success btn-lg" onclick="window.location='login.jsp'"> Login  </button>
  <button id="btntwo" class="btn btn-success btn-lg" onclick="window.location='register.jsp'"> Register  </button>
	</div>
	

</body>
</html>
