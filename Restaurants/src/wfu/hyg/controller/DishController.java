package wfu.hyg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import wfu.hyg.pojo.Order;
   

@Controller
public class DishController {
	  int a=1;
	@RequestMapping("/dishbuy")
      public String dishBuy(HttpServletRequest request,HttpServletResponse response,HttpSession session, int id ){	    	
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
	    return dishBuyMain(request, session);
	}				
	@RequestMapping("d")
    public String dishBuyMain(HttpServletRequest request,HttpSession session ){
		return "main";		
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
}
