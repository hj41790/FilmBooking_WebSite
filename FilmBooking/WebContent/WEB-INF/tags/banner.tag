<%@ tag language="java" pageEncoding="UTF-8" import="filmbooking.MemberBean"%>



<div style="float:left; padding-left:20pt">

<%
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
		MemberBean mem = (MemberBean)session.getAttribute("member");
		
		if(isLogin!=null && mem!=null && mem.getName_mem().equals("admin")){
%>
	<a href="control_member.jsp?action=admin" style="padding-right:5pt">관리자 페이지</a>
<%
		}
%>
	<a href="control_booking.jsp?action=list">홈으로</a>

</div>


<div style="float:right; padding-right:20pt" >

<%
		if(isLogin==null || isLogin==false){
%>
			<a href="login.html">로그인</a>

<%
		}else{
			if(!mem.getName_mem().equals("admin")){
%>
			<a href="userpage.jsp" style="padding-left:5pt"><%=((MemberBean)session.getAttribute("member")).getName_mem() %></a> 님 접속을 환영합니다.  
<%
			}
%>	
			<a href="control_member.jsp?action=logout" style="padding-left:5pt">로그아웃</a>
<%
		}
%>		

</div>
