package wfu.hyg.dao;

import java.util.List;
import java.util.Map;

import wfu.hyg.pojo.OrderBean;

public interface OrderBeanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderBean record);

    int insertSelective(OrderBean record);

    OrderBean selectByPrimaryKey(Integer id);
    
    List<OrderBean> selectByWhere(Map map);

    int updateByPrimaryKeySelective(OrderBean record);

    int updateByPrimaryKey(OrderBean record);

	int updateOrderState(Integer id);
}