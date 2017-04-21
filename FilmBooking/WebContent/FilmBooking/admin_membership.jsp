<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList, filmbooking.MemberBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="top" %>
<jsp:useBean id="memlist" scope="request" class="java.util.ArrayList" />


<html>
	<head>
		<title>회원관리</title>
	</head>
	
	<body><center>
		
		<top:admin_banner/>
		<h1 style="padding-top:50pt;padding-bottom:30pt">회원 관리</h1>
		
		<table align="center" style="border-collapse:collapse;">
		
			<tr height="50" valign="middle" bgcolor="#fce7e7">
				<th width="200">ID</th>
				<th width="100">나이</th>
				<th width="200">등록 일자</th>
				<th width="200">회원 삭제</th>
			</tr>
			
<%--			<hr width="500px" color="#efefef"/> --%>

<%
	for(MemberBean m : (ArrayList<MemberBean>)memlist){
%>

		<tr align="center" height="40" valign="middle">
			<td><%= m.getName_mem() %> </td>
			<td><%= m.getAge_mem() %></td>
			<td><%= m.getRegister_date() %></td>
			<td> <a href="control_member.jsp?action=delmember&id_mem=<%=m.getId_mem() %>">remove</a></td>
		</tr>

<%
	}
%>
		</table>
	
	</center></body>
</html>