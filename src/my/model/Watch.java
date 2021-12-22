package my.model;

import java.util.Date;

public class Watch {
	private int watchId;
	private String watchName;
	private String brand;
	private int price;
	private String watchImage;
	private String memo;
	private Date watchTime;
	private int watchClick;
	private String watchStyle;
	private String watchAge;
	private String watchType;
	private String watchImage1;
	private String watchImage2;
	private String watchImage3;

	public Watch(){}

	public Watch(String watchName, String brand, int price, String watchImage, String memo, Date watchTime,
			String watchStyle, String watchAge, String watchType, String watchImage1, String watchImage2,
			String watchImage3) {
		super();
		this.watchName = watchName;
		this.brand = brand;
		this.price = price;
		this.watchImage = watchImage;
		this.memo = memo;
		this.watchTime = watchTime;
		this.watchStyle = watchStyle;
		this.watchAge = watchAge;
		this.watchType = watchType;
		this.watchImage1 = watchImage1;
		this.watchImage2 = watchImage2;
		this.watchImage3 = watchImage3;
	}

	public int getWatchId() {
		return watchId;
	}

	public void setWatchId(int watchId) {
		this.watchId = watchId;
	}

	public String getWatchName() {
		return watchName;
	}

	public void setWatchName(String watchName) {
		this.watchName = watchName;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getWatchTime() {
		return watchTime;
	}

	public void setWatchTime(Date watchTime) {
		this.watchTime = watchTime;
	}

	public int getWatchClick() {
		return watchClick;
	}

	public void setWatchClick(int watchClick) {
		this.watchClick = watchClick;
	}

	public String getWatchStyle() {
		return watchStyle;
	}

	public void setWatchStyle(String watchStyle) {
		this.watchStyle = watchStyle;
	}

	public String getWatchAge() {
		return watchAge;
	}

	public void setWatchAge(String watchAge) {
		this.watchAge = watchAge;
	}

	public String getWatchType() {
		return watchType;
	}

	public void setWatchType(String watchType) {
		this.watchType = watchType;
	}

	public String getWatchImage1() {
		return watchImage1;
	}

	public void setWatchImage1(String watchImage1) {
		this.watchImage1 = watchImage1;
	}

	public String getWatchImage2() {
		return watchImage2;
	}

	public void setWatchImage2(String watchImage2) {
		this.watchImage2 = watchImage2;
	}

	public String getWatchImage3() {
		return watchImage3;
	}

	public void setWatchImage3(String watchImage3) {
		this.watchImage3 = watchImage3;
	}
}
