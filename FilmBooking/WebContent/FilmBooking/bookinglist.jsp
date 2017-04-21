<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList, filmbooking.BookingBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("euc-kr"); %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="top" %>
<jsp:useBean id="bookinglist" scope="request" class="java.util.ArrayList" />

<html>
	<head>
		<title>예매 정보</title>
	</head>
	
	<body>
	
		<top:banner/>
		
		<br><br><h1 align="center">예매 내역</h1><br><br>
		
		
		<table align="center" style="border-collapse:collapse;">
		
			<tr height="50" valign="middle" bgcolor="#e7e7f9">
				<th width="300">영화 제목</th>
				<th width="200">상영 기간</th>
				<th width="150">예약일</th>
				<th width="150">좌석 번호</th>
				<th width="150">예약 상황</th>
				<th width="200">결제 및 취소</th>
			</tr>

<%
	String status;
	for(BookingBean m : (ArrayList<BookingBean>)bookinglist){
%>

		<tr align="center" height="80" valign="middle">
			<td><%= m.getFilm_name() %></td>
			<td><%= m.getDate() %></td>
			<td><%= m.getResv_time() %></td>
			<td><%= m.getSeat_no() %></td>		
			
<%
		if(m.getStatus()==false) {
%>			
			<td>-</td>
			<td> 
				<form action="payment.jsp" method=post>
					<input type=hidden name=id_resv value=<%=m.getId_resv()%>>
<%--					<input type=submit value="결제"style="background-color:#dedede; height:25pt; width:100pt"> --%>
					<input type=submit value="결제"style="background-color:#cecef2; height:25pt; width:100pt">
				</form>
			
<%			
		} else {
%>	
			<td>결제 완료</td>
			<td> 
<%
		}
%>		
				<form action="control_booking.jsp?action=delbooking" method=post>
					<input type=hidden name=id_resv value=<%=m.getId_resv()%>>
					<input type=submit value="예매내역 삭제"style="background-color:#cecef2; height:25pt; width:100pt">
				</form>

			</td>

		</tr>

<%
	}
%>
		</table>

	</body>
</html>