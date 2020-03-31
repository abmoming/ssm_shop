package com.xm.service;

import java.util.List;

import com.xm.pojo.Category;
import com.xm.pojo.Product;

public interface IProductService {

	/**通过产品id查询对应的产品信息
	 * @param product_id
	 * @return
	 */
	Product selectProductById(Integer product_id);
	
	/**通过产品分类id查询所有的对应的产品信息
	 * @param category_id
	 * @return
	 */
	List<Product> queryProductByCategoryId(Integer category_id);
	
	/**通过产品分类id设置对应的产品分类的productList属性
	 * @param category
	 */
	void setProductListByCategoryId(List<Category> categoryList);

	/**通过Cid查询所有的产品信息（分页查询）
	 * @return
	 */
	List<Product> queryAllProductByCid(Integer pageNum, Integer pageSize, Integer categoryId);

	/**添加商品信息
	 * @param product
	 */
	void saveProduct(Product product);

	/**通过产品id修改产品信息
	 * @param product
	 */
	void updateByProductIdSelective(Product product);

	/**通过数组产品id，删除对应的产品(即将产品状态改为0删除)
	 * @param productIds
	 */
	void deleteProductById(Integer[] productIds);

	/**通过数组产品id，打开对应的产品(即将产品状态改为1打开)
	 * @param productIds
	 */
	void saveOpenProduct(Integer[] productIds);
}
