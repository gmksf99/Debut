package my.model;
import java.util.Date;

public class Purchase {
	private int purchaseId;
	private String userId;
	private int watchId;
	private int price;
	private int amount;
	private String gift;
	private Date pDate;
	private String address;
	private String watchStyle;
	

	public Purchase() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Purchase(String userId, int watchId, int price, int amount, String gift, Date pDate, String address, String watchStyle) {
		super();
		this.userId = userId;
		this.watchId = watchId;
		this.price = price;
		this.amount = amount;
		this.gift = gift;
		this.pDate = pDate;
		this.address = address;
		this.watchStyle = watchStyle;
	}
	public int getPurchaseId() {
		return purchaseId;
	}
	public void setPurchaseId(int purchaseId) {
		this.purchaseId = purchaseId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getWatchId() {
		return watchId;
	}
	public void setWatchId(int watchId) {
		this.watchId = watchId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getGift() {
		return gift;
	}
	public void setGift(String gift) {
		this.gift = gift;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getWatchStyle() {
		return watchStyle;
	}


	public void setWatchStyle(String watchStyle) {
		this.watchStyle = watchStyle;
	}
	
	
}
