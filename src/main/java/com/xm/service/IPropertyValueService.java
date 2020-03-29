package com.xm.service;

import java.util.List;

import com.xm.pojo.PropertyValue;

public interface IPropertyValueService {

	/**ͨ通过商品id查询对应的商品属性值ֵ
	 * @param product_id
	 * @return
	 */
	List<PropertyValue> queryPropertyValueById(Integer product_id);

	/**添加属性值
	 * @param propertyValue
	 */
	void addPropertyValue(PropertyValue propertyValue);

	/**通过propertyId查询属性值表的属性值是否为null
	 * @param propertyId
	 */
	String selectIsValueNull(Integer propertyId);

}
