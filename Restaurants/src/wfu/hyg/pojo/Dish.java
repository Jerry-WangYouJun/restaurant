package wfu.hyg.pojo;

import org.springframework.stereotype.Service;


@Service
public  class Dish {
	//共用属性
	public int dish_id;

	public double dish_price;
	public String dish_name;
	private String dish_img;
	private int dish_value;
	private String dish_state;
	public double getDish_price() {
		return dish_price;
	}
	public void setDish_price(double dish_price) {
		this.dish_price = dish_price;
	}
	public String getDish_name() {
		return dish_name;
	}
	public void setDish_name(String dish_name) {
		this.dish_name = dish_name;
	}
	
	public int getDish_value() {
		return dish_value;
	}
	public void setDish_value(int dish_value) {
		this.dish_value = dish_value;
	}
	public String getDish_img() {
		return dish_img;
	}
	public void setDish_img(String dish_img) {
		this.dish_img = dish_img;
	}
	
	public int getDish_id() {
		return dish_id;
	}
	public void setDish_id(int dish_id) {
		this.dish_id = dish_id;
	}
	public String getDish_state() {
		return dish_state;
	}
	public void setDish_state(String dish_state) {
		this.dish_state = dish_state;
	}
	
	
}
