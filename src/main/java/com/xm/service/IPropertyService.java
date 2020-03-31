package com.xm.service;

import java.util.List;

import com.xm.pojo.Property;

public interface IPropertyService {
	/**ͨ通过主键查询对应的商品属性
	 * @param id
	 * @return
	 */
	Property selectById(Integer id);

	/**通过cid查询对应的属性(分页)
	 * @param pageNum
	 * @param pageSize
	 * @param cid
	 * @return List<Property>
	 */
	List<Property> selectByCid(Integer pageNum,Integer pageSize,Integer cid);

	/**添加分类属性
	 * @param property
	 */
	void addProperty(Property property);

	/**通过分类属性id删除或批量删除对应的分类属性
	 * @param propertyId
	 */
	void deletePropertyByIds(Integer[] propertyId);

}
