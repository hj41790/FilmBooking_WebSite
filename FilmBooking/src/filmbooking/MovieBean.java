package filmbooking;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MovieBean {
	private int id_film;
	private String name_film;
	private int age_phase;
	private int seat_num;
	private String date;
	
	private Date start_date;
	private Date end_date;
	
	public int getId_film() {
		return id_film;
	}
	public void setId_film(int id_film) {
		this.id_film = id_film;
	}
	public String getName_film() {
		return name_film;
	}
	public void setName_film(String name_film) {
		this.name_film = name_film;
	}
	public int getAge_phase() {
		return age_phase;
	}
	public String getAge_phasetoString(){
		if(age_phase==0) return "전체 관람가";
		return age_phase+"세";
	}
	public void setAge_phase(int age_phase) {
		this.age_phase = age_phase;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
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
	
	public String getDate() {
		return date;
	}
	
	public void setDate(){
		SimpleDateFormat b = new SimpleDateFormat("yyyy-MM");
		String a = b.format(start_date).toString()+" - "
				+b.format(end_date).toString();
		this.date = a;
	}
	
}
