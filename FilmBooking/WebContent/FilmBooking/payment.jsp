<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.Calendar, java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>


<html>

	<head>
		<title>결제</title>
	</head>
	
	<body><center>
	
		<br><br><h1>카드 결제</h1><br>
	
		<hr width="500px" color="#efefef"/><br><br>

<form action="control_booking.jsp?action=payment" method="post">	

		<input type="hidden" name=id_resv value=<%=request.getParameter("id_resv") %>>
	
		<table align="center">
		
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">카드번호</td>
				<td width="300" align="center"> <input type=text name=card_num size=30 maxlength=20> </td>
			</tr>
			
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">유효날짜</td>
				<td width="300" align="center"> 
					<select name="month" size=1 style="width:50pt">
<%
						int i;
						for(i=1; i<=12; i++){
%>					
							<option value=i><%=i %></option>
<%
						}
%>
					</select> 
					<select name="year" size=1 style="width:60pt;margin-left:10pt">
<%
						int j;
						Calendar today = Calendar.getInstance();
						int year = today.get(Calendar.YEAR);
						for(j=year; j<=year+20; j++){
%>					
							<option value=j><%=j %></option>
<%
						}
%>
					</select>
				</td>
			</tr>
			
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">CVC</td>
				<td width="300" align="center"> <input type=password name=cvc size=30 maxlength=20> </td>
			</tr>
		
		</table>
		
		<p align="center">
			<br><br>
			<input type="submit" value="결제" style="width:100pt; height:30pt; margin-right:15pt; background-color:#dedede"/>
			<input type="reset" value="초기화" style="width:100pt; height:30pt; margin-right:15pt; background-color:#dedede" />
			<input type="button" value="취소" onclick="control_booking.jsp?action=list"style="width:100pt; height:30pt; margin-right:15pt; background-color:#dedede"/>
		</p>	
	
	
</form>
	
	</center></body>
	
</html>