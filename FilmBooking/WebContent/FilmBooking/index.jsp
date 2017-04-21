<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	session.setAttribute("isLogin", false);
	session.removeAttribute("member");
	pageContext.forward("control_booking.jsp?action=list"); 

%>