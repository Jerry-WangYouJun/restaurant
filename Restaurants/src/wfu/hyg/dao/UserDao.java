package wfu.hyg.dao;


import java.util.List;

import wfu.hyg.pojo.User;

public interface UserDao  {
	
	public User loginValiDate(User user);

	public int insert(User user);

	public List<User> queryMeun(User user);
	
	public List<User> querySeller();

	public int updateMoney(User user);
	
	public int updateByPrimaryKey(User user);

	public int updateCash(User user);
	
	public int deleteByPrimaryKey(int id); 
}
