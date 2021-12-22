package my.model;

public class Cart {
	private String id;
	private int amount;
	private String gift;
	
	
	public Cart(){}

	public Cart(String id, int amount, String gift) {
		super();
		this.id = id;
		this.amount = amount;
		this.gift = gift;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

}
