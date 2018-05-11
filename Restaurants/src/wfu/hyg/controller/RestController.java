package wfu.hyg.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

import wfu.hyg.pojo.Dish;
import wfu.hyg.pojo.Grid;
import wfu.hyg.pojo.User;
import wfu.hyg.service.DishServiceImpl;
import wfu.hyg.service.UserServiceImpl;
import wfu.hyg.util.CodeUtil;

@Controller
public class RestController {
	
	@Autowired
	UserServiceImpl userserviceImpl;
	@Autowired
	DishServiceImpl dishserviceImpl;
	@Autowired
	User user;
	@Autowired
	Dish dish;
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpSession session){
		String loginname=request.getParameter("username");
		String loginpass=request.getParameter("password");	
		User user=new User();
		user.setUsername(loginname);
		user.setPassword(loginpass);
		User pojo = userserviceImpl.loginvalidate(user);
		Object obj = session.getAttribute("orderbuyList");
		if(obj != null){
			session.removeAttribute("orderbuyList");
		}
		if(pojo!=null){					
			String name=pojo.getUsername();
			session.setAttribute("username", name);	
			session.setAttribute("userId", pojo.getId());
			session.setAttribute("userBean", pojo);
			if("1".equals(pojo.getRole())) {
				return "forward:/index.jsp";
			}
			String dishAll = DishAll(session);
			return dishAll;
		}
		String msg="登录失败，请重新登录";
		request.setAttribute("msg", msg);
		return "Login";				
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public Grid getUserList(Model model) {
		 Grid grid = new Grid();
		 List<Dish> list = dishserviceImpl.dishAll();
		 grid.setRows(list);
		 grid.setTotal((long)list.size());
		 return grid;
	}
	
	@RequestMapping("/dishAll")
	public String DishAll(HttpSession session){
		User user = (User)session.getAttribute("userBean");
		if("2".equals(user.getRole())){
			List<Dish> dishAll = dishserviceImpl.queryByUser(user.getId());
			session.setAttribute("dishList", dishAll);
		}else{
			List<User> dishAll = userserviceImpl.querySeller();
			session.removeAttribute("sellerId");
			session.setAttribute("sellerList", dishAll);
			session.removeAttribute("orderbuyList");
		}
		return "main";	
	}

	@RequestMapping("/ajaxadd_dish")
	public void  addDishAjax(Dish dish ,  HttpServletRequest request , HttpServletResponse response 
			,HttpSession session,@RequestParam("upfile") MultipartFile[] files) {
		PrintWriter out;
		try {
			User user = (User)session.getAttribute("userBean");
			dish.setUser_id(user.getId());
			for(MultipartFile file:files){
				dish.setDish_img(file.getOriginalFilename());
				CodeUtil.SaveFileFromInputStream(file );
			}
			dishserviceImpl.addDish(dish);
			List<Dish> dishAll = dishserviceImpl.queryByUser(user.getId());
			session.setAttribute("dishList", dishAll);
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("success", true);
			json.put("msg", "操作成功");
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/ajaxupdate_dish")
	public void  ajaxupdateDish(Dish dish ,  HttpServletRequest request , HttpServletResponse response 
			,HttpSession session,@RequestParam("upfile") MultipartFile[] files) {
		PrintWriter out;
		try {
			User user = (User)session.getAttribute("userBean");
			dish.setUser_id(user.getId());
			for(MultipartFile file:files){
				dish.setDish_img(file.getOriginalFilename());
				CodeUtil.SaveFileFromInputStream(file );
			}
			dishserviceImpl.updatePriceById(dish);
			List<Dish> dishAll = dishserviceImpl.queryByUser(user.getId());
			session.setAttribute("dishList", dishAll);
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("success", true);
			json.put("msg", "操作成功");
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//添加菜品
		@RequestMapping("/addDish")
		public String addDish(HttpServletRequest request , Dish dish ,HttpSession session 
				,@RequestParam("upfile") MultipartFile[] files) {
			User user = (User)session.getAttribute("userBean");
			dish.setUser_id(user.getId());
			 dishserviceImpl.addDish(dish);
			int i=dish.getDish_id();
			List<Dish> dishAll = dishserviceImpl.queryByUser(user.getId());
			session.setAttribute("dishList", dishAll);
			if(i>0){
			return "Right";
			}
			return "defeat";
		}
		//通过id删除菜品
		@RequestMapping("/delDish")
		public String delDish(HttpServletRequest request){
			
			String dishid=request.getParameter("dishid");
			dish.setDish_id(Integer.parseInt(dishid));
			int i=dishserviceImpl.delDish(dish);
			if(i>0){
				return "Right";
			}
			return "defeat";
			
		}
		//通过id更改菜品的价格
		@RequestMapping("/updatePriceById")
		public String updatePriceById(HttpServletRequest request,Dish dish,Model model ,HttpSession session){
			User user = (User)session.getAttribute("userBean");
			dish.setUser_id(user.getId());
			dishserviceImpl.updatePriceById(dish);
			request.setAttribute("index", 1);
			return this.SelectDishList(request,model,session);
		}
		
		@RequestMapping("/selectDishList")
		public String SelectDishList(HttpServletRequest request,Model model ,HttpSession session){
			User user = (User)session.getAttribute("userBean");
			List<Dish> list = dishserviceImpl.queryByUser(user.getId());
			model.addAttribute("dishList", list);
			return "editMenu";
		}
		
		@RequestMapping("/selectDishFen")
		public String SelectDishFen(HttpServletRequest request,Model model){
			Integer page;
			if(request.getParameter("index")==null){
				page=1;
			}else{ 
				page = Integer.parseInt(request.getParameter("index"));
			}				
			if(page<=0||page==null){
				page=1;
			}
			int index=(page-1)*4;
			List<Dish> list = dishserviceImpl.selectDishFen(index);
			model.addAttribute("dishList", list);
			model.addAttribute("index", page);
			//request.setAttribute("dishList", list);
			//request.setAttribute("index", page);
			return "editMenu";
		}
		//根据ID查询菜品
		@RequestMapping("/selectDishById")
		public String SelectDishById(HttpServletRequest request,Model model){
			int id = Integer.parseInt(request.getParameter("dishId"));
			List<Dish> list=dishserviceImpl.selectDish(id);
			model.addAttribute("dishList", list);
			return "updateDish";
		}
		//根据菜名查询
		@RequestMapping("queryByName")
		public String queryByName(HttpServletRequest request){
			String name=request.getParameter("dishname");
			List<Dish> list = dishserviceImpl.queryByName(name);
			request.setAttribute("dishList",list);
			return "editMenu";
		}

}
