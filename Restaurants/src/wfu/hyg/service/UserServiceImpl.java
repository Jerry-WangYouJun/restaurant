package wfu.hyg.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import wfu.hyg.dao.UserDao;
import wfu.hyg.pojo.User;
@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao userdao;
	
	@Override
	public User loginvalidate(User user) {
		User userlogin=userdao.loginValiDate(user);
		return userlogin;
		
	
		
	}

	public int inserUser(User user) {
		return userdao.insert(user);
	}

	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateUser(User user) {
		 return userdao.updateMoney(user);
	}

	public int deleteUser(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<User> queryMeun() {
		// TODO Auto-generated method stub
		return userdao.queryMeun();
	}

	public int updateCash(User user) {
		return userdao.updateCash(user);
	}


}
