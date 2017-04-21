package filmbooking;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class DBBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/film_booking?autoReconnect=true&&useSSL=false";

	public DBBean() {}
	
	void connect(){
		try {
			 Class.forName(jdbc_driver);
			 conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	void disconnect(){
		if(pstmt != null){
			try{
				pstmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		if(conn != null){
			try{
				conn.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<MovieBean> getMovieList(){
		ArrayList<MovieBean> list = new ArrayList<MovieBean>();
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from movie";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MovieBean tmp = new MovieBean();
				tmp.setId_film(rs.getInt("id_film"));
				tmp.setAge_phase(rs.getInt("age_phase"));
				tmp.setName_film(rs.getString("name_film"));
				tmp.setSeat_num(rs.getInt("seat_num"));
				tmp.setStart_date(rs.getDate("start_date"));
				tmp.setEnd_date(rs.getDate("end_date"));
				tmp.setDate();
				list.add(tmp);
			}
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return list;
	}
	
	public ArrayList<BookingBean> getBookingList(MemberBean member){
		ArrayList<BookingBean> list = new ArrayList<BookingBean>();
		int id = member.getId_mem();
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from booking where id_mem=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BookingBean tmp = new BookingBean();
				tmp.setId_resv(rs.getInt("id_resv"));
				tmp.setId_mem(rs.getInt("id_mem"));
				tmp.setId_film(rs.getInt("id_film"));
				tmp.setFilm_name(rs.getString("film_name"));
				tmp.setStart_date(rs.getDate("start_date"));
				tmp.setEnd_date(rs.getDate("end_date"));
				tmp.setResv_time(rs.getDate("resv_time"));
				tmp.setSeat_no(rs.getInt("seat_no"));
				tmp.setStatus(rs.getBoolean("status"));
				tmp.setDate();
				
				list.add(tmp);
			}
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return list;
	}
	
	public ArrayList<MemberBean> getMemberList(){
		ArrayList<MemberBean> list = new ArrayList<MemberBean>();
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String admin = "admin";
			String sql = "select * from membership where name_mem!=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MemberBean tmp = new MemberBean();
				tmp.setId_mem(rs.getInt("id_mem"));
				tmp.setAge_mem(rs.getInt("age_mem"));
				tmp.setName_mem(rs.getString("name_mem"));
				tmp.setRegister_date(rs.getDate("register_date"));
				
				list.add(tmp);
			}
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return list;
	}
	
	public boolean idCheck(MemberBean member){
		boolean result = true;

		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from membership where name_mem=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName_mem());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) result = false;
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return result;
		
	}
	
	public void register(MemberBean member){
		String sql = "insert into membership values(0,?,?,?,?)";
		Date today = new Date(Calendar.getInstance().getTimeInMillis());
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName_mem());
			pstmt.setInt(3, member.getAge_mem());
			pstmt.setDate(4, today);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
	}
	
	public boolean loginCheck(MemberBean member){
		boolean result = false;
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from membership where name_mem=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName_mem());
			pstmt.setString(2, member.getPassword());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) result = true;
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return result;
	}
	
	public MemberBean getMember(MemberBean member){
		MemberBean result = new MemberBean();
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from membership where name_mem=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName_mem());
			pstmt.setString(2, member.getPassword());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				result.setId_mem(rs.getInt("id_mem"));
				result.setName_mem(rs.getString("name_mem"));
				result.setPassword(rs.getString("password"));
				result.setAge_mem(rs.getInt("age_mem"));
				result.setRegister_date(rs.getDate("register_date"));
			}
			else result = null;
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return result;
	}
	
	public MovieBean getMovie(int id){
		MovieBean result = new MovieBean();
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from movie where id_film=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				result.setId_film(rs.getInt("id_film"));
				result.setName_film(rs.getString("name_film"));
				result.setAge_phase(rs.getInt("age_phase"));
				result.setSeat_num(rs.getInt("seat_num"));
				result.setStart_date(rs.getDate("start_date"));
				result.setEnd_date(rs.getDate("end_date"));
				result.setDate();
			}
			else result = null;
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return result;
	}
	
	public SeatBean getSeat(int id){
		SeatBean result = new SeatBean();
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from seat where id_film=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				result.setId_film(rs.getInt("id_film"));
				result.setId_seat(rs.getInt("id_seat"));
				for(int i=1; i<=9; i++){
					String name = "s"+i;
					result.setStatus(i-1, rs.getBoolean(name));
				}
			}
			else result = null;
			
			rs.close();
			pstmt.close();
		
		} catch(Exception e){
			System.out.println(e);
		}
		
		disconnect();
		
		return result;
	}
	
	public boolean addBooking(int id_film, int seat_no, int id_mem){
		MovieBean movie = getMovie(id_film);
		Date today = new Date(Calendar.getInstance().getTimeInMillis());
		
		try{
			connect();
			while(conn.isClosed()==true) connect();

			String seat = "s"+seat_no;
			String check = "select * from seat where id_film=? and "+seat+"=true";
			pstmt = conn.prepareStatement(check);
			pstmt.setInt(1, id_film);
			ResultSet rs = pstmt.executeQuery();
			if(!rs.next()){
				rs.close();
				pstmt.close();
				return false;
			}
			rs.close();
			pstmt.close();

			String sql = "update seat set "+seat+"=false where id_film=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_film);
			pstmt.executeUpdate();
			pstmt.close();			

			sql = "insert into booking values(0,?,?,?,?,?,?,?,false)";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, id_mem);
			pstmt.setInt(2, id_film);
			pstmt.setString(3, movie.getName_film());
			pstmt.setDate(4, movie.getStart_date());
			pstmt.setDate(5, movie.getEnd_date());
			pstmt.setDate(6, today);
			pstmt.setInt(7, seat_no);
			pstmt.executeUpdate();
			pstmt.close();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		
		disconnect();
		
		return true;
	}
	
	public void deleteBooking(int id_resv){
		
		int seat_no = 0;
		int id_film = 0;
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from booking where id_resv=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_resv);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				seat_no = rs.getInt("seat_no");
				id_film = rs.getInt("id_film");
			}
			rs.close();
			pstmt.close();

			sql = "delete from booking where id_resv=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_resv);
			pstmt.executeUpdate();
			pstmt.close();
			
			String seat = "s"+seat_no;
			sql = "update seat set "+seat+"=true where id_film=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_film);
			pstmt.executeUpdate();
			pstmt.close();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		
		disconnect();
	}
	
	public void deleteMovie(int id_film){
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "delete from seat where id_film=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_film);
			pstmt.executeUpdate();
			pstmt.close();

			sql = "delete from booking where id_film=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_film);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from movie where id_film=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_film);
			pstmt.executeUpdate();
			pstmt.close();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		
		disconnect();
	}
	
	public void deleteMember(int id_mem){
		
		try{
			connect();
			while(conn.isClosed()==true) connect();
			
			String sql = "select * from booking where id_mem=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_mem);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int id_film = rs.getInt("id_film");
				int seat_no = rs.getInt("seat_no");
				String seat = "s"+seat_no;
				String sql2 = "update seat set "+seat+"=true where id_film=?";
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, id_film);
				pstmt2.executeUpdate();
				pstmt2.close();
			}
			
			rs.close();
			pstmt.close();
			
			sql = "delete from booking where id_mem=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_mem);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from membership where id_mem=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_mem);
			pstmt.executeUpdate();
			pstmt.close();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		
		disconnect();
	}
	
	public void modifyMember(MemberBean member){
		try{
			connect();
			while(conn.isClosed()==true) connect();

			String sql = "update membership set password=?, age_mem=? where id_mem=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setInt(2, member.getAge_mem());
			pstmt.setInt(3, member.getId_mem());
			pstmt.executeUpdate();
			pstmt.close();			

		
		} catch(Exception e){
			e.printStackTrace();
		}
		
		disconnect();
	}
	
	public void payment(int id_resv){
		try{
			connect();
			while(conn.isClosed()==true) connect();

			String sql = "update booking set status=true where id_resv=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id_resv);
			pstmt.executeUpdate();
			pstmt.close();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		
		disconnect();
	}
	
	public void addMovie(MovieBean movie){
		
		try{
			connect();
			while(conn.isClosed()==true) connect();

			String sql = "insert into movie values(0,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, movie.getName_film());
			pstmt.setInt(2, movie.getAge_phase());
			pstmt.setInt(3, movie.getSeat_num());
			pstmt.setDate(4, movie.getStart_date());
			pstmt.setDate(5, movie.getEnd_date());
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "select last_insert_id()";
			pstmt = conn.prepareStatement(sql);		
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int id_film = rs.getInt(1);		
			System.out.println(id_film);
			rs.close();
			pstmt.close();
			
			sql = "insert into seat values(0,?,true,true,true,true,true,true,true,true,true)";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, id_film);
			pstmt.executeUpdate();
			pstmt.close();
		
		} catch(Exception e){
			e.printStackTrace();
		}
		disconnect();
	}

}
