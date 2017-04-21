package filmbooking;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MemberBean {
	private int		id_mem;
	private String	name_mem;
	private String	password;
	private int		age_mem;
	private Date 	register_date;
	
	private String 	date;
	
	public MemberBean(){
		id_mem = -1;
		name_mem = "";
		password = "";
		age_mem = -1;
		register_date = null;
	}
	

	public int getId_mem() {
		return id_mem;
	}


	public void setId_mem(int id_mem) {
		this.id_mem = id_mem;
	}


	public String getName_mem() {
		return name_mem;
	}

	public void setName_mem(String name_mem) {
		this.name_mem = name_mem;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge_mem() {
		return age_mem;
	}

	public void setAge_mem(int age_mem) {
		this.age_mem = age_mem;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
		
		SimpleDateFormat b = new SimpleDateFormat("yyyy-MM-dd");
		this.date = b.format(register_date).toString();
	}


	public String getDate() {
		return date;
	}
	
	
}
