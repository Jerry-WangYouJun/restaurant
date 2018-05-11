package wfu.hyg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import wfu.hyg.pojo.Dish;
import wfu.hyg.pojo.Grid;
import wfu.hyg.pojo.Order;
import wfu.hyg.pojo.User;
import wfu.hyg.service.DishServiceImpl;
   

@Controller
public class DishController {
	
	@Autowired
	DishServiceImpl dishserviceImpl;
	  int a=1;
	@SuppressWarnings("unchecked")
	@RequestMapping("/dishbuy")
      public String dishBuy(HttpServletRequest request,HttpServletResponse response,HttpSession session
    		  , int id, int user_id ){	    	
		List<Order> orderList = (List<Order>) session.getAttribute("orderbuyList");
	  //   String count=request.getParameter("count")
		 String name1=request.getParameter("name1");
	     String price1=request.getParameter("price1"); 
	     if(orderList==null){
	    	 orderList=new ArrayList<Order>();
	     }
	     boolean flag = true ;
	     for(Order o : orderList) {
	    	 	  if(o.getOrder_id() == id ) {
	    	 		   o.setOrder_count(o.getOrder_count() + 1);
	    	 		  flag = false ;
	    	 		  break ;
	    	 	  }
	     }
	     if(flag) {
		    	 Order order = new Order();
		    	 order.setOrder_name(name1);
		    	 order.setOrder_price(Double.valueOf(price1));
		    	 order.setOrder_id(Integer.valueOf(id));
		    	 order.setOrder_count( 1);
		    	 order.setOrder_state(0);
		    	 orderList.add(order);
	     }
	    // order.setOrder_count(Integer.parseInt(count));
//	     session.setAttribute("count", 1);
	     session.setAttribute("orderbuyList", orderList);
	     session.setAttribute("sellerId", user_id);
	    return dishBuyMain(request, session);
	}
	
	
	@RequestMapping("d")
    public String dishBuyMain(HttpServletRequest request,HttpSession session ){
		return "main";		 
	}
	
	@RequestMapping("/userbuy")
    public String dishList(HttpServletRequest request , HttpSession session ){
		String id = request.getParameter("id");
		List<Dish> dishAll = dishserviceImpl.queryByUser(Integer.valueOf(id));
		session.setAttribute("dishList", dishAll);
		return "Right";		
	}
	
	@RequestMapping("/dishdelete")
	public String deleteDish(HttpServletRequest request,HttpSession session,  int id) {
		System.out.println(id);
		List<Order> orderList = (List<Order>) session.getAttribute("orderbuyList");
		for(Order  o : orderList) {
			if(o.getOrder_id() == id ) {
				  if(o.getOrder_count() > 1) {
					   o.setOrder_count(o.getOrder_count()-1);
				  }else if(o.getOrder_count() <= 1) {
					  orderList.remove(o);
					  break ;
				  }
			}
		}
		return "main";
	}
	@RequestMapping("/dishadd")
	public String dddDish(HttpServletRequest request,HttpSession session,  int id) {
		List<Order> orderList = (List<Order>) session.getAttribute("orderbuyList");
		for(Order  o : orderList) {
			if(o.getOrder_id() == id ) {
					   o.setOrder_count(o.getOrder_count() + 1);
			}
		}
		return "main";
	}
	@RequestMapping("/dishdeleteAll")
	public String dishdeleteAll(HttpSession session,  int id) {
		List<Order> orderList = (List<Order>) session.getAttribute("orderbuyList");
		for(Order  o : orderList) {
			if(o.getOrder_id() == id ) {
				 orderList.remove(o);
				  break ;
			}
		}
		return "main";
	}
	
	@ResponseBody
	@RequestMapping("/dishList")
	public List<Dish> getUserList(Model model , HttpSession session) {
		 Grid grid = new Grid();
		 User user = (User)session.getAttribute("userBean");
		 List<Dish> list  = new ArrayList<>() ;
		 if("2".equals(user.getRole())){
			 list = dishserviceImpl.queryByUser(user.getId());
			}else if("3".equals(user.getRole())){
			 list = dishserviceImpl.queryByName(user.getUsername());
			}
		 model.addAttribute("userList", list);
		 grid.setRows(list);
		 grid.setTotal((long)list.size());
		 return list;
	}
}
