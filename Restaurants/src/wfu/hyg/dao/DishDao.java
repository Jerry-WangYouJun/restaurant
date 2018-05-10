package wfu.hyg.dao;

import java.util.List;

import wfu.hyg.pojo.Dish;

public interface DishDao {
	public int addDish(Dish dish);
	public Integer delDish(Dish dish);
	public Integer updatePriceById(Dish dish);
	public List<Dish> selectDishFen(int index);
	public List<Dish> selectDish(int id);
	public List<Dish> queryByName(String name);
	public List<Dish> dishAll();
}
