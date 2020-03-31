package com.xm.service;

import java.util.List;

import com.xm.pojo.Category;
import com.xm.pojo.Product;

public interface ICategoryService {
	/**查询所有商品类型
	 * @return
	 */
	List<Category> queryCategory();
	
	/**ͨ通过商品分类id查询相关的商品
	 * @param id
	 * @return
	 */
	List<Product> queryProductByCategoryId(Integer id);

	/**通过id查询对应的产品分类
	 * @param categoryId
	 * @return
	 */
	Category selectById(Integer categoryId);

	/**分页查询产品分类
	 * @param pageNum
	 * @param pageSize
	 */
	List<Category> queryCategory(Integer pageNum, Integer pageSize);

	/**添加产品分类
	 * @param category
	 */
	void addCategory(Category category);

	/**通过id数组批量删除
	 * @param categoryId
	 */
	void deleteCategoryByIds(Integer[] categoryId);

	/**通过id修改产品分类
	 * @param category
	 */
	void updateCategoryById(Category category);
	
}
