<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList, filmbooking.MovieBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="top" %>
<jsp:useBean id="movielist" scope="request" class="java.util.ArrayList" />

<% if(movielist==null) response.sendRedirect("control_booking.jsp?action=list"); %>

<html>
	<head>
		<title>영화 예매</title>
	</head>
	
	<body><center>
	
		<top:banner/>
		
		<h1 style="padding-top:50pt;padding-bottom:30pt">상영 영화 리스트</h1>
		
		
		<table align="center" style="border-collapse:collapse;">
		
			<tr height="50" valign="middle" bgcolor="#e7e7f9">
				<th width="300">타이틀</th>
				<th width="200">상영기간</th>
				<th width="150">관람가</th>
				<th width="100">총 좌석 수</th>
				<th width="100">예매</th>
			</tr>

<%
	for(MovieBean m : (ArrayList<MovieBean>)movielist){
%>

		<tr align="center" height="60" valign="middle">
			<td><%= m.getName_film() %></td>
			<td><%= m.getDate() %></td>
			<td><%= m.getAge_phasetoString() %></td>
			<td><%= m.getSeat_num() %></td>
			<td> 
				<form action="control_booking.jsp?action=booking" method=post>
					<input type=hidden name=id_film value=<%=m.getId_film()%>>
					<input type=submit value="예매"style="background-color:#cecef2; height:25pt; width:50pt">
				</form>
			</td>
		</tr>

<%
	}
%>
		</table>

	</center></body>
</html>