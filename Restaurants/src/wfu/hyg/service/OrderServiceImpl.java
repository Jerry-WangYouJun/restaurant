package wfu.hyg.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import wfu.hyg.dao.OrderBeanMapper;
import wfu.hyg.dao.OrderDao;
import wfu.hyg.pojo.Order;
import wfu.hyg.pojo.OrderBean;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
	private OrderDao orderdao;
    
    @Resource
	private OrderBeanMapper mainOrderDao;
    
	@Override
	public int insertAddOrder(Order order) {	
		return orderdao.insertAddOrder(order);
	}

	@Override
	public int deleteOrder(Order order) {
		return orderdao.deleteOrder(order);		
	}

	@Override
	public List<Order> selectOrderFen(Integer index) {
		// TODO Auto-generated method stub
		return orderdao.selectOrderFen(index);
	}

	@Override
	public int deleteOrderAll(Integer[] ids) {
		// TODO Auto-generated method stub
		return orderdao.deleteOrderAll(ids);
	}

	@Override
	public int updeteOrder(Integer id) {
		// TODO Auto-generated method stub
		return orderdao.updeteOrder(id);
	}

	@Override
	public int insertOrder(OrderBean orderBean) {
		return mainOrderDao.insert(orderBean);
	}

	@Override
	public List<Order> selectOrderDetail(Order order) {
		return orderdao. selectOrder(order);
	}

	@Override
	public List<OrderBean> selectOrderAll(Map map) {
		return mainOrderDao.selectByWhere(map);
	}

	@Override
	public int updeteOrderState(Integer id) {
		return mainOrderDao.updateOrderState(id);
	}

}
