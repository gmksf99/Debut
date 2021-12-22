package my.model;

public class User {

	private String userId;
	private String pwd;
	private String userName;
	private String userBirth;
	private String address;
	private String phone;
	private int vip;
	
	public User(){}

	public User(String userId, String pwd, String userName, String userBirth, String address, String phone) {
		super();
		this.userId = userId;
		this.pwd = pwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.address = address;
		this.phone = phone;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getVip() {
		return vip;
	}

	public void setVip(int vip) {
		this.vip = vip;
	}
	
	
}
