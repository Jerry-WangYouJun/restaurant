package wfu.hyg.dao;

import java.util.List;

import wfu.hyg.pojo.Order;

public interface OrderDao {
	public int 	insertAddOrder(Order order); 
	public int deleteOrder(Order order);
	public List<Order> selectOrder(Order order);
	public List<Order> selectOrderAll();
	public List<Order> selectOrderFen(Integer index);
	public int deleteOrderAll(Integer[] index);
	public int updeteOrder(Integer id);
}
