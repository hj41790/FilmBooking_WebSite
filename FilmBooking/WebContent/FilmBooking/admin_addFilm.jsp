<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>

<html>
	<head>
		<title>영화 추가</title>
	</head>
	
	<body>
		
		<br><br><h1 align="center">영화 추가 </h1><br><br>
		
<form action="control_booking.jsp?action=addmovie" method="post">
		
		<table align="center">
		
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">타이틀</td>
				<td width="300" align="center"> <input type=text name=name_film size=30> </td>
			</tr>
			
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">관람가</td>
				<td width="300" align="center"> 
					<select name="age_phase" size=1 style="width:100pt;margin-left:10pt;margin-right:5pt">
						<option value=0>전체 관람가</option>
						<option value=12>12세</option>
						<option value=15>15세</option>
						<option value=18>18세</option>
					</select>
				</td>
			</tr>
			
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef" rowspan="2">상영기간</td>
				
				<td width="300" align="center"> 

					<select name="year1" size=1 style="width:60pt;margin-left:10pt;margin-right:5pt">
						<option value=2016>2016</option>
						<option value=2017>2017</option>
						<option value=2018>2018</option>
					</select>
					년
					<select name="month1" size=1 style="width:50pt">
<%
						int i;
						for(i=1; i<=12; i++)
							out.println("<option value="+i+">"+i+"</option>");
%>					
					</select> 
					월 부터
				</td>
				
			</tr>
		
			<tr height="45" valign="middle"> 
				<td width="300" align="center"> 

					<select name="year2" size=1 style="width:60pt;margin-left:10pt;margin-right:5pt">
						<option value=2016>2016</option>
						<option value=2017>2017</option>
						<option value=2018>2018</option>
					</select>
					년
					<select name="month2" size=1 style="width:50pt" >
<%
						int j;
						for(j=1; j<=12; j++)
							out.println("<option value="+j+">"+j+"</option>");
%>					
					</select> 
					월 까지
				</td>
			</tr>
			
		</table>
		
		<p align="center">
			<br><br>
			<input type="submit" value="등록" style="width:100pt; height:30pt; margin-right:15pt; background-color:#dedede"/>
			<input type=reset value="초기화" style="width:100pt; height:30pt; margin-right:15pt; background-color:#dedede">		
		</p>	
		
</form>
	
	</body>
</html>