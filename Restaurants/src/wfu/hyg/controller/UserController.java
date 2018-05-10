package wfu.hyg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import wfu.hyg.pojo.User;
import wfu.hyg.service.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name="userServiceImpl")
	private UserServiceImpl userService;
	
	@RequestMapping("/userMenu")
	public String getUserMeun(Model model) {
		 List<User> list = userService.queryMeun();
		 model.addAttribute("userList", list);
		 return "userMenu";	
	}
	
	@ResponseBody
	@RequestMapping("/loginOut")
	public Map loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("userId");
		request.getSession().removeAttribute("userName");
		request.getSession().removeAttribute("role");
		request.getSession().removeAttribute("loged");
		Map<String,Object> result = new HashMap<String,Object>();
			result.put("success", true);
			result.put("msg", "退出成功!");
		return result;
	}
	
	
	@RequestMapping("/user_input")
	public String addInput(Map<String, Object> map){
		map.put("user", new User());
		return "user_add";
	}
	
	@RequestMapping(value="/user_add",method=RequestMethod.POST)
	public String addUser(User user , Model model){
		int i = this.userService.inserUser(user);
		if(i>0){
			return  "Right";
			}
			return "defeat";
	}
	
	@RequestMapping(value="user_update_input/{id}",method=RequestMethod.GET)
	public String updateInput(@PathVariable("id") Integer id,Map<String, Object> map){
		User user = this.userService.getUserById(id);
		map.put("user", user);
		return "user_update";
	}
	
	@RequestMapping(value="/updateCash",method=RequestMethod.GET)
	public String updateUser(User user,Model model ,HttpServletRequest request){
		User  loginUser  = (User)request.getSession().getAttribute("userBean");
		user.setMoney(user.getMoney());
		int rows = this.userService.updateCash(user);
		return getUserMeun(model);
	}
	@ResponseBody
	@RequestMapping(value="/user_delete",method=RequestMethod.POST)
	public Map deleteUser(@RequestParam("id") String id){
		Map map = new HashMap();
		int rows = this.userService.deleteUser(id);
		if (rows > 0) {
			map.put("success", true);
			map.put("msg", "删除用户成功！");
		}else{
			map.put("success", false);
			map.put("msg", "删除用户失败！");
		}
		return map;
	}
}
