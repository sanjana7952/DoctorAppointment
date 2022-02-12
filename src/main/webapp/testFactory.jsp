<%@page import="com.doctorappointment.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1>I'm creating session factory object </h1>
	<%
		//singleton design pattern
		out.print(FactoryProvider.getFactory());
	    
	%>
</body>
</html>