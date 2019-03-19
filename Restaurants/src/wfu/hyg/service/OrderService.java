package wfu.hyg.service;

import java.util.List;
import java.util.Map;

import wfu.hyg.pojo.Order;
import wfu.hyg.pojo.OrderBean;

public interface OrderService {
	public int insertOrder(OrderBean orderBean);
    public int insertAddOrder(Order order);
    public int deleteOrder(Order order);
    public List<Order> selectOrderDetail(Order order);
	public List<Order> selectOrderFen(OrderBean order); 
	public int deleteOrderAll(Integer[] index);
	public int updeteOrder(Integer id);
	public List<OrderBean> selectOrderAll(Map map);
	public int updeteOrderState(Integer id);
}
