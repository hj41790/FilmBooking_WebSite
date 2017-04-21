<%@ page import="filmbooking.*,java.util.*,java.sql.Date,java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="db" scope="page" class="filmbooking.DBBean"/>
<jsp:useBean id="movie" class="filmbooking.MovieBean" />
<jsp:useBean id="seat" class="filmbooking.SeatBean"/>
<jsp:useBean id="booking" class="filmbooking.BookingBean"/>
<jsp:setProperty property="*" name="movie"/>
<jsp:setProperty property="*" name="seat"/>
<jsp:setProperty property="*" name="booking"/>

<% 
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	
	int lastBookingNum;

	if(action.equals("list")){
		ArrayList<MovieBean> list = db.getMovieList();
		request.setAttribute("movielist", list);
		pageContext.forward("main.jsp");
	}
	else if(action.equals("booking")){
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
		if(isLogin==null || isLogin==false) response.sendRedirect("login.html");
		else{
			int id = seat.getId_film();
			seat = db.getSeat(id);
			
			MemberBean mem = (MemberBean)session.getAttribute("member");
			movie = db.getMovie(id);
			
			if(mem.getAge_mem()<movie.getAge_phase()){
				String msg = "선택하신 영화는 "+movie.getAge_phase()+"세 관람가로 예매하실 수 없습니다.";
				request.setAttribute("header", "예매 실패");
				request.setAttribute("errmsg", msg);
				pageContext.forward("errorpage.jsp");
			}
			else if(mem.getName_mem().equals("admin")){
				String msg = "관리자 계정은 예매가 불가능한 계정입니다.";
				request.setAttribute("header", "예매 실패");
				request.setAttribute("errmsg", msg);
				pageContext.forward("errorpage.jsp");
			}
			else{
				request.setAttribute("movie", movie);
				request.setAttribute("seat", seat);
				pageContext.forward("booking.jsp");
			}
		}
	}
	else if(action.equals("addbooking")){
		int id_film = Integer.parseInt(request.getParameter("id_film"));
		int seat_no = Integer.parseInt(request.getParameter("seat_no"));
		int id_mem = ((MemberBean)session.getAttribute("member")).getId_mem();
		
		if(!db.addBooking(id_film, seat_no, id_mem)){
			String msg = "선택하신 자리는 이미 예매되었습니다.";
			request.setAttribute("header", "예매 실패");
			request.setAttribute("errmsg", msg);
			pageContext.forward("errorpage.jsp");
		}
		else{
			response.sendRedirect("control_booking.jsp?action=bookinglist");
		}
	}
	else if(action.equals("bookinglist")){
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
		if(isLogin==null || isLogin==false) response.sendRedirect("login.html");
		else{
			MemberBean mem = (MemberBean)session.getAttribute("member");
			ArrayList<BookingBean> list = db.getBookingList(mem);
			request.setAttribute("bookinglist", list);
			pageContext.forward("bookinglist.jsp");
		}
		
	}
	else if(action.equals("payment")){
		String msg = "";
		boolean valid = true;
		int id_resv = Integer.parseInt(request.getParameter("id_resv"));
		
		if(request.getParameter("card_num").equals("")){
			msg += "카드번호를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(request.getParameter("cvc").equals("")){
			msg += "CVC 번호를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		
		if(valid){
			db.payment(id_resv);
			response.sendRedirect("control_booking.jsp?action=bookinglist");
		}
		else{
			request.setAttribute("header", "결제 실패");
			request.setAttribute("errmsg", msg);
			pageContext.forward("errorpage.jsp");
		}
	}
	else if(action.equals("delbooking")){
		int id_resv = Integer.parseInt(request.getParameter("id_resv"));
		db.deleteBooking(id_resv);
		response.sendRedirect("control_booking.jsp?action=bookinglist");
	}
	else if(action.equals("delmovie")){
		int id_film = Integer.parseInt(request.getParameter("id_film"));
		db.deleteMovie(id_film);
		response.sendRedirect("control_member.jsp?action=admin");
	}
	else if(action.equals("addmovie")){
		System.out.println(request.getParameter("name_film"));
		int start_month = Integer.parseInt(request.getParameter("month1"));
		int end_month 	= Integer.parseInt(request.getParameter("month2"));
		int start_year 	= Integer.parseInt(request.getParameter("year1"));
		int end_year 	= Integer.parseInt(request.getParameter("year2"));
		
		String msg = "";
		boolean valid = true;
		int age_phase = Integer.parseInt(request.getParameter("age_phase"));
		
		if(request.getParameter("age_phase").equals("")){
			msg += "관람가를 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		if(request.getParameter("name_film").equals("")){
			msg += "영화 제목을 입력하지 않으셨습니다.<br>";
			valid = false;
		}
		
		if(valid==false){
			String header = "영화 등록 실패";
			request.setAttribute("header", header);
			request.setAttribute("errormsg", msg);
			pageContext.forward("errorpage.jsp");
		}
		else{
			String start = start_year + "-" + start_month + "-1";
			String end	 = end_year	  + "-"	+ end_month	  + "-25";
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			Date start_date = new Date(format.parse(start).getTime());
			Date end_date = new Date(format.parse(end).getTime());
			movie.setStart_date(start_date);
			movie.setEnd_date(end_date);
			movie.setSeat_num(9);
			
			db.addMovie(movie);
			response.sendRedirect("control_member.jsp?action=admin");
		}
		
	}
	
%>