package filmbooking;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class BookingBean {
	private int id_resv;
	private int id_mem;
	private int id_film;
	private String film_name;
	private Date start_date;
	private Date end_date;
	private Date resv_time;
	private int seat_no;
	private boolean status;
	
	private String date;

	public int getId_resv() {
		return id_resv;
	}

	public void setId_resv(int id_resv) {
		this.id_resv = id_resv;
	}

	public int getId_mem() {
		return id_mem;
	}

	public void setId_mem(int id_mem) {
		this.id_mem = id_mem;
	}

	public int getId_film() {
		return id_film;
	}

	public void setId_film(int id_film) {
		this.id_film = id_film;
	}

	public String getFilm_name() {
		return film_name;
	}

	public void setFilm_name(String film_name) {
		this.film_name = film_name;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getResv_time() {
		return resv_time;
	}

	public void setResv_time(Date resv_time) {
		this.resv_time = resv_time;
	}

	public int getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate() {
		SimpleDateFormat b = new SimpleDateFormat("yyyy-MM");
		String a = b.format(start_date).toString()+" - "
				+b.format(end_date).toString();
		this.date = a;
	}
	
}
