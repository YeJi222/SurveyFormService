package userInfo;

public class UserDTO {
	// user 변수 선언 
	private String userID;
	private String userPW;
	// private String regidate;
	
	// user 변수별 게터와 세터
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	/*
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	*/
	
	// 초기화해주는 함수 - constructor
	public UserDTO() {
	}
	
	public UserDTO(String userID, String userPW) {
		super();
		this.userID = userID;
		this.userPW = userPW;
	}
}
