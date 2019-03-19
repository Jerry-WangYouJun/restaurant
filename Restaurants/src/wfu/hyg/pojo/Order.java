package wfu.hyg.pojo;

public class Order  {
	private int order_id;
	private double order_pricesum;
	private int order_number;
	private int order_table;
	private int order_state;
	public double 	order_price;
	public String order_name;
	public int order_count;
	private String location;
	private String orderDate;
	
    
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public double getOrder_pricesum() {
		return order_pricesum;
	}
	public void setOrder_pricesum(double order_pricesum) {
		this.order_pricesum = order_pricesum;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getOrder_table() {
		return order_table;
	}
	public void setOrder_table(int order_table) {
		this.order_table = order_table;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}

	
	/**
	 * @return the order_price
	 */
	public double getOrder_price() {
		return order_price;
	}
	/**
	 * @param order_price the order_price to set
	 */
	public void setOrder_price(double order_price) {
		this.order_price = order_price;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public Order(int order_pricesum, int order_number, int order_table,
			int order_state, int order_price, String order_name, int order_count) {
		super();
		this.order_pricesum = order_pricesum;
		this.order_number = order_number;
		this.order_table = order_table;
		this.order_state = order_state;
		this.order_price = order_price;
		this.order_name = order_name;
		this.order_count = order_count;
	}
	public Order() {
	
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
}
