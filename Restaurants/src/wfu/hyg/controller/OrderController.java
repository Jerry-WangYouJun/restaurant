package wfu.hyg.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.StringUtils;

import wfu.hyg.pojo.Order;
import wfu.hyg.pojo.OrderBean;
import wfu.hyg.pojo.User;
import wfu.hyg.service.OrderService;
import wfu.hyg.service.UserServiceImpl;

@Controller
public class OrderController {
    
	@Resource
	private OrderService orderservice;
	
	@Resource(name="userServiceImpl")
	private UserServiceImpl userService;
	
	@RequestMapping("/addorder")
	public String OrderAdd(HttpServletRequest request,HttpSession session,Model model ,
			String cash , String location , String orderDate){
		List<Order> orderList = (List<Order>) session.getAttribute("orderbuyList");
		double money = 0;
		String state = "";
		SimpleDateFormat   sDateFormat   =   new   SimpleDateFormat("hhmmss");   
		String   date   =   sDateFormat.format(new java.util.Date()); 
		int num = Integer.valueOf(date);
		for(Order order : orderList) {
			order.setOrder_number(num);
			order.setLocation(location);
			order.setOrderDate(orderDate);
			order.setOrder_pricesum(order.getOrder_price() * order.getOrder_count());
			money += order.getOrder_price() * order.getOrder_count();
			int insertAddOrder = orderservice.insertAddOrder(order);
		}
		User user =(User) request.getSession().getAttribute("userBean");
		if("0".equals(cash)) {
			if(user.getMoney() > money) {
				user.setMoney(user.getMoney() - money);
				userService.updateUser(user);
				state = "1";
			}else {
				state="0";
				request.setAttribute("msg", "账户余额不足，请充值或用现金交易");
			}
		}else{
			state = "1";
		}
		int sid = (Integer)session.getAttribute("sellerId");
		orderservice.insertOrder(new OrderBean(num, money + "", state, orderDate , user.getId(),cash,sid));
		session.removeAttribute("orderbuyList");
		session.removeAttribute("sellerId");
		return "main";
	} 
	@RequestMapping("/deleteorder")
	public void OrderDelete(HttpServletRequest request,HttpSession session,Model model){
		//String id = request.getParameter("irder_id");
		Order order = new Order();
		order.setOrder_id(1);
		int deleteOrder = orderservice.deleteOrder(order);
		if(deleteOrder>0){
			System.out.println("deleteOrder");
			System.out.println("成功删除");
		}
	}
	
	@RequestMapping("selectOrderDetail")
	public String selectOrderDetail(HttpServletRequest request,Model model){
		String number=request.getParameter("order_number");
		Order order = new Order();
		order.setOrder_number(Integer.parseInt(number));
		List<Order> selectOrder = orderservice.selectOrderDetail(order);
		model.addAttribute("orderList", selectOrder);
		return "orderDetails";		
	}
	
	@RequestMapping("selectOrder")
	public String SelectOrder(HttpServletRequest request,Model model){
		String number=request.getParameter("order_number");
		 Map map = new HashMap<>();
		map.put("orderid", number);
		List<OrderBean> selectOrder = orderservice.selectOrderAll(map);
		model.addAttribute("orderList",selectOrder);
		return "orderInfomation";		
	}
	
	@RequestMapping("selectOrderByUser")
	public ModelAndView SelectOrderAll(HttpSession session){
	    Map map = new HashMap<>();
	    User user = (User)session.getAttribute("userBean");
	    if("2".equals(user.getRole())){
			map.put("s_id", user.getId());
		}else if("3".equals(user.getRole())){
			map.put("user", user.getId());
		}
		List<OrderBean> selectOrder = orderservice.selectOrderAll(map);
	    ModelAndView andView = new ModelAndView();
	    andView.addObject("orderList", selectOrder);
	    andView.setViewName("orderInfomation");
		return andView;	
	}
	
	public List<Order> getCountOrder(List<Order> orderList){
		//List<Order> orderList = new ArrayList<Order>();
		Map<Integer , Order> orderMap = new HashMap<Integer, Order>();
		for(Order o : orderList) {
			 if(orderMap.containsKey(o.getOrder_number())) {
				 Order orderInMap = orderMap.get(o.getOrder_number());
				   o.setOrder_pricesum(orderInMap.getOrder_pricesum()+ o.getOrder_pricesum());
				   o.setOrder_count(orderInMap.getOrder_count()+o.getOrder_count());
				   orderMap.put(o.getOrder_number(), o);
			 }else {
				 orderMap.put(o.getOrder_number(), o);
			 }
		}
		List<Order> resultList =  new ArrayList<Order>();
		 for(Order order : orderMap.values()) {
			 resultList.add(order);
		 }
		return resultList ;
	}
	
	@RequestMapping("/selectMainOrder")
	public String selectMainOrder(HttpServletRequest request){
				List<OrderBean> list = orderservice.selectOrderAll(new HashMap());
				//model.addAttribute("orderList", list);
				//model.addAttribute("index", page);
				request.setAttribute("orderList", list);
				return "orderInfomation";
	}
	
	@RequestMapping("/selectOrderFen")
	public String SelectOrderFen(HttpServletRequest request ){
				User user = (User)request.getSession().getAttribute("userBean");
				Map map = new HashMap();
				if("2".equals(user.getRole())){
					map.put("s_id", user.getId());
				}else if("3".equals(user.getRole())){
					map.put("user", user.getId());
				}
				String state = request.getParameter("state");
				if(!StringUtils.isNullOrEmpty(state)){
					 map.put("state", state);
				}
				List<OrderBean> list = orderservice.selectOrderAll(map);
				request.setAttribute("orderList",  list );
				return "orderInfomation";
	}
	
	@RequestMapping("/deleteall")
	public String  DeleteAll(HttpServletRequest request){	
		//获取字符串
		String deleteall =request.getParameter("value");
		//初始化数组的时候要确定数组的大小
		 int count=deleteall.length();
		Integer[] index=new Integer[count];
		//截取字符串
		String[] strs=deleteall.split(",");
		for(int i=0;i<strs.length;i++){
	       index[i]=Integer.parseInt(strs[i].toString());
		}
		int delectOrderAll = orderservice.deleteOrderAll(index);
		if(delectOrderAll>0){			
			request.setAttribute("index", 1);
			String selectOrderFen = this.SelectOrderFen(request);	
			return selectOrderFen;
		}
		return "defeat";
	}
	@RequestMapping("/updeteOrder")
	public String updeteOrder(HttpServletRequest request){
		Integer id=Integer.parseInt(request.getParameter("order_id"));
		int updeteOrder = orderservice.updeteOrderState(id);
		if(updeteOrder>0){
			return "forward:/selectOrderByUser.action";
		}
		return "defeat";
	}
	@RequestMapping("/clearorder")
	public String clearorder(HttpSession session){
		List<Order> orderbuyList = (List<Order>) session.getAttribute("orderbuyList");
		orderbuyList=null;
		session.setAttribute("orderbuyList", orderbuyList);
		return "Left";
		
	}
}
