package filmbooking;

public class SeatBean {
	
	int id_seat;
	int id_film;
	boolean status[];
	
	public SeatBean(){
		status = new boolean[9];
	}

	public int getId_seat() {
		return id_seat;
	}

	public void setId_seat(int id_seat) {
		this.id_seat = id_seat;
	}

	public int getId_film() {
		return id_film;
	}

	public void setId_film(int id_film) {
		this.id_film = id_film;
	}

	public boolean[] getStatus() {
		return status;
	}

	public void setStatus(boolean[] status) {
		this.status = status;
	}
	
	public boolean getStatus(int index) {
		return status[index];
	}
	
	public void setStatus(int index, boolean value) {
		status[index] = value;
	}
	
	public String getStatustoString(int index){
		if(status[index]) return "예매 가능";
		return "예매 불가";
	}

}
