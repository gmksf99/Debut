package my.model;

public class Fav {
	private int favId;
	private String userId;
	private int watchId;
	private String WatchName;
	private int price;
	private String watchImage;
	private String watchImage1;
	
	public Fav(){}

	

	public Fav(String userId, int watchId, String watchName, int price, String watchImage, String watchImage1) {
		super();
		this.userId = userId;
		this.watchId = watchId;
		WatchName = watchName;
		this.price = price;
		this.watchImage = watchImage;
		this.watchImage1 = watchImage1;
	}



	public int getFavId() {
		return favId;
	}

	public void setFavId(int favId) {
		this.favId = favId;
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



	public String getWatchName() {
		return WatchName;
	}



	public void setWatchName(String watchName) {
		WatchName = watchName;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getWatchImage() {
		return watchImage;
	}



	public void setWatchImage(String watchImage) {
		this.watchImage = watchImage;
	}



	public String getWatchImage1() {
		return watchImage1;
	}



	public void setWatchImage1(String watchImage1) {
		this.watchImage1 = watchImage1;
	}
	
	
}