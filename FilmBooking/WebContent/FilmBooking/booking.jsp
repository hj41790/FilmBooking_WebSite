<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="filmbooking.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="top" %>
<jsp:useBean id="movie" scope="request" class="filmbooking.MovieBean" />
<jsp:useBean id="seat" scope="request" class="filmbooking.SeatBean" />

<html>
	<head>
		<title>영화 예매</title>
	</head>
	
	<body>
	
		<top:banner/>
		
		<br><br><h1 align=center>좌석 목록 : <%=movie.getName_film() %></h1><br><br>
		
		<table align="center" style="border-collapse:collapse;">
		
			<tr height="50" valign="middle" bgcolor="#e7e7f9">
				<th width="300">좌석번호</th>
				<th width="300">좌석현황</th>
				<th width="300">예매</th>
			</tr>

<%
	for(int i=0; i<9; i++){
%>

		<tr align="center" height="60" valign="middle">
			<td><%=i+1 %></td>
			<td><%=seat.getStatustoString(i) %></td>
			<td> 
<%
		if(seat.getStatus(i)){
%>			
				<form action="control_booking.jsp?action=addbooking" method=post>
					<input type=hidden name=id_film value=<%=seat.getId_film()%> />
					<input type=hidden name=seat_no value=<%=i+1%> />
					<input type=submit value="예매"style="background-color:#dedede; height:25pt; width:100pt" />
				</form>
			</td>
		</tr>

<%
		}
	}
%>
		</table>

	</body>
</html>