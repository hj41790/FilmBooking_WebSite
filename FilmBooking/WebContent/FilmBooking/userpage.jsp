<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="top" %>


<html>
	<head>
		<title>회원정보</title>
	</head>
	
	<body>
		
		<top:banner/>
		<br><br><h1 align="center">회원 정보</h1><br><br>
		
		<hr width="500px" color="#efefef"/><br><br>
		
		<p align="center">
			<button onclick="location.href='modify_mem.jsp'" style="width:200pt; height:50pt; margin-right:15pt; background-color:#dedede; font-size:15pt">회원 정보 수정</button>
		</p>

<form action="control_booking.jsp?action=bookinglist" method="post">
		
		<p align="center" style="margin-top:50">
			<br><br>
			<input type="submit" value="예매 내역 보기" style="width:200pt; height:50pt; margin-right:15pt; background-color:#dedede; font-size:15pt"/>
		</p>	
		
</form>


	</body>
</html>