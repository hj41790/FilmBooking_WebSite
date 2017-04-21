<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="top" %>

<html>
	<head>
		<title>오류 발생</title>
	</head>
	
	
	<body>
		<top:banner/>
		<br><br><h1 align=center><%=request.getAttribute("header") %></h1><br>
	
		<hr width="500px" color="#efefef"/><br>
		
		<p align=center> <%=request.getAttribute("errmsg") %> </p>
		
	
	</body>
</html>