package wfu.hyg.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import wfu.hyg.dao.DishDao;
import wfu.hyg.pojo.Dish;
@Service
public class DishServiceImpl implements DishService {
	@Resource
	DishDao dishDao;
	@Override
	public int addDish(Dish dish) {
		int add=dishDao.addDish(dish);
		return add;
	}
	@Override
	public Integer delDish(Dish dish) {
		int del=dishDao.delDish(dish);
		return del;
	}
	@Override
	public Integer updatePriceById(Dish dish) {
		int update=dishDao.updatePriceById(dish);
		return update;
	}
	@Override
	public List<Dish> selectDishFen(int index) {
		return dishDao.selectDishFen(index);
	}
	@Override
	public List<Dish> selectDish(int id) {
		
		return dishDao.selectDish(id);
	}
	@Override
	public List<Dish> queryByName(String name) {
		return dishDao.queryByName(name);
	}
	@Override
	public List<Dish> dishAll() {
		return dishDao.dishAll();
	}
	@Override
	public List<Dish> queryByUser(Integer id) {
		return dishDao.queryByUser(id);
	}

}
