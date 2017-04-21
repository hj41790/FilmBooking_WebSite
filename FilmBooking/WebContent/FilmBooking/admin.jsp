<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList, filmbooking.MovieBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="top" %>
<jsp:useBean id="movielist" scope="request" class="java.util.ArrayList" />

<html>

	<head>
		<title>관리자 페이지</title>
	</head>
	
		
	<body><center>
		
		<top:admin_banner/>
		<h1 style="padding-top:50pt;padding-bottom:30pt">영화관리</h1>
		
		<table align="center" style="border-collapse:collapse;">
		
			<tr height="50" valign="middle" bgcolor="#fce7e7">
				<th width="300">타이틀</th>
				<th width="150">관람가</th>
				<th width="100">총 좌석 수</th>
				<th width="200">상영기간</th>
				<th width="100">삭제</th>
			</tr>

<%
	for(MovieBean m : (ArrayList<MovieBean>)movielist){
%>

		<tr align="center" height="60" valign="middle">
			<td><%= m.getName_film() %></td>
			<td><%= m.getAge_phasetoString() %></td>
			<td><%= m.getSeat_num() %></td>
			<td><%= m.getDate() %></td>
			<td> <a href="control_booking.jsp?action=delmovie&id_film=<%=m.getId_film() %>">remove</a></td>
		</tr>

<%
	}
%>
		</table>
	
	</center></body>
	
</html>