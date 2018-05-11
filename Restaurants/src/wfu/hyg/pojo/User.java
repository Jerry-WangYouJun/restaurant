package wfu.hyg.pojo;

import java.io.Serializable;

import org.springframework.stereotype.Service;

@Service
public class User  implements  Serializable {
	private Integer id;
	private String username;
	private String password;
	private String role;
	private Double money;
	private String img;
	public User(String username, String password) {
		
		this.username = username;
		this.password = password;
	}
	public User(){}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
