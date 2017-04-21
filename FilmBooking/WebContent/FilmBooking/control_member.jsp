<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="filmbooking.*,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="db" scope="page" class="filmbooking.DBBean"/>
<jsp:useBean id="mem" class="filmbooking.MemberBean" />
<jsp:setProperty property="*" name="mem"/>

<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");

	if(action.equals("login")){
		boolean valid = true;
		String msg = "";
		
		if(request.getParameter("name_mem").equals("")){
			msg += "ID를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(request.getParameter("password").equals("")){
			msg += "패스워드를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		
		if(valid && !db.loginCheck(mem)){
			msg += "로그인에 실패하였습니다.<br>";
			valid = false;
			
		}
		
		if(valid){
			mem = db.getMember(mem);
			session.setAttribute("member", mem);
			session.setAttribute("isLogin", true);
			
			if(mem.getName_mem().equals("admin"))
				pageContext.forward("control_member.jsp?action=admin");
			else
				pageContext.forward("control_booking.jsp?action=list");
		}
		else{
			request.setAttribute("header", "로그인 실패");
			request.setAttribute("errmsg", msg);
			pageContext.forward("errorpage.jsp");
		}
		
	}
	else if(action.equals("logout")){
		session.setAttribute("isLogin", false);
		session.removeAttribute("member");
		pageContext.forward("control_booking.jsp?action=list");
	}
	else if(action.equals("register")){
		
		boolean valid = true;
		String msg = "";
		
		if(request.getParameter("name_mem").equals("")){
			msg += "ID를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(request.getParameter("password").equals("")){
			msg += "패스워드를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(request.getParameter("password1").equals("")){
			msg += "패스워드 재입력이 필요합니다.<br>";
			valid = false;
		}
		if(request.getParameter("age_mem").equals("")){
			msg += "나이를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(valid && !mem.getPassword().equals(request.getParameter("password1"))){
				msg += "패스워드 입력이 일치하지 않습니다.<br>";
				valid = false;
		}
		
		if(valid && !db.idCheck(mem)){
			msg += "id 중복입니다.<br>";
			valid = false;
		}
		
		if(valid){
			db.register(mem);
			response.sendRedirect("login.html");
		}
		else{
			request.setAttribute("header", "회원가입 실패");
			request.setAttribute("errmsg", msg);
			pageContext.forward("errorpage.jsp");
		}
		
		
	}
	else if(action.equals("modify")){
		boolean valid = true;
		String msg = "";
		MemberBean member = (MemberBean)session.getAttribute("member");
		
		if(request.getParameter("name_mem").equals("")){
			msg += "ID를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(request.getParameter("password").equals("")){
			msg += "패스워드를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(request.getParameter("password1").equals("")){
			msg += "패스워드 재입력이 필요합니다.<br>";
			valid = false;
		}
		if(request.getParameter("age_mem").equals("")){
			msg += "나이를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		
		if(valid && !mem.getPassword().equals(request.getParameter("password1"))){
				msg += "패스워드 입력이 일치하지 않습니다.<br>";
				valid = false;
		}
		else if(valid && !member.getName_mem().equals(mem.getName_mem())){
			msg += "잘못된 아이디 입력입니다.<br>";
			valid = false;
		}
		
		mem.setId_mem(member.getId_mem());
		if(valid){
			db.modifyMember(mem);
			session.setAttribute("member", mem);
			response.sendRedirect("userpage.jsp");
		}
		else{
			request.setAttribute("header", "회원정보 수정 실패");
			request.setAttribute("errmsg", msg);
			pageContext.forward("errorpage.jsp");
		}
		
	}
	else if(action.equals("admin")){
		ArrayList<MovieBean> list = db.getMovieList();
		request.setAttribute("movielist", list);
		pageContext.forward("admin.jsp");
	}
	else if(action.equals("memManage")){
		ArrayList<MemberBean> list = db.getMemberList();
		request.setAttribute("memlist", list);
		pageContext.forward("admin_membership.jsp");
	}
	else if(action.equals("delmember")){
		int id_mem = Integer.parseInt(request.getParameter("id_mem"));
		db.deleteMember(id_mem);
		response.sendRedirect("control_member.jsp?action=memManage");
	}

%>