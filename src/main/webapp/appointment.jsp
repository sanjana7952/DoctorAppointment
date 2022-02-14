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
<%@include file="components/navbar.jsp" %>
</head>

<style type="text/css">

h1{

background-color: #29918D!important;
height:60px!important;
width: 450px!important;
border-radius:30px!important;
position: absolute!important;
background-attachment:fixed!important ;
left:425px!important;

}

h1 {

text-align: center!important;

}

.center {

  margin-left: auto!important;

  margin-right: auto!important;

}

 

table {

font-family: "Lato","sans-serif"; 

opacity:0.9;

}       /* added custom font-family  */

 

table.one {                                 

margin-bottom: 3em;

border-collapse:collapse;   }  

 

td {                            /* removed the border from the table data rows  */

text-align: center;    

width: 10em;                   

padding: 1em;

color:black;

font-size:20px;     }      

 

th {                              /* removed the border from the table heading row  */

text-align: center!important;                

padding: 1em!;

background-color:#29918D;      /* added a red background color to the heading cells  */

color: white;

font-size:25px;      }                 /* added a white font color to the heading text */

 

tr {   

height: 1em!important;    }

 

table tr:nth-child(even) {            /* added all even rows a #eee color  */

    background-color:#C0EAE8 ;

  

        }

 

table tr:nth-child(odd) {            /* added all odd rows a #fff color  */

background-color:white;      }
 

</style>

</head>

 

<body style="background-image:url('https://46epqg1nvwdyfsoda2r2gw01-wpengine.netdna-ssl.com/wp-content/uploads/2016/11/appointment-1024x683.jpg');

background-repeat: no-repeat;

height: 100%;

 width: 100%;

 margin-left:auto;

margin-right:auto;

background-size: cover;

background-attachment: fixed;

">

<%

     Doctor doctor= (Doctor)session.getAttribute("current_doctor");

     if(doctor==null){

        session.setAttribute("message","Not Logged-in ..Please Login First!!");

        response.sendRedirect("login.jsp");

        return;

     }

%>

 

 

<!-- <a href="LogoutServlet" style="float:right;" ><button class="btn btn-outline-danger my-2 my-sm-0">Log-Out</button></a>

-->

 

<div class="container text-center">

    <br><h1 class="text-white">APPOINTMENT LIST</h1><br><hr><br><br>

       <div class="row">

           <div class="col">

              <form action="AppointmentServlet" method="post">

                 <input type="hidden" name="oprt" value="getAppointmentDetails">

                <b> Date : </b> <input type="date" id="dateInput" name="date">

                 <input class="btn btn-success" type="submit"  value="Search">

              </form>

           </div>

          

           

           

           

           

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

                                     <th><b><i>Patient Name</i></b></th>

                                     <th><b><i>Patient Mobile</i></b></th>

                                     <th><b><i>Date</i></b></th>

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

                                     <th><b><i>Patient Name</i></b></th>

                                     <th><b><i>Mobile</i></b></th>

                                     <th><b><i>Date</i></b></th>

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

                     

                    } %>

               </div>

       </div>

</div><br><br><br>
<%-- <%@include file="components/footer.jsp" %>  --%>
</body>

</html>
