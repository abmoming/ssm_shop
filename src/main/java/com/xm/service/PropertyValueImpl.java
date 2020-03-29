package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.mapper.PropertyMapper;
import com.xm.mapper.PropertyValueMapper;
import com.xm.pojo.Property;
import com.xm.pojo.PropertyValue;
import com.xm.pojo.PropertyValueExample;

@Service
public class PropertyValueImpl implements IPropertyValueService {
	
	@Autowired
	PropertyValueMapper propertyValueMapper;
	
	@Autowired
	IPropertyService propertyService;
	
	@Override
	public List<PropertyValue> queryPropertyValueById(Integer product_id) {
		PropertyValueExample example = new PropertyValueExample();
		example.or().andProductIdEqualTo(product_id);
		List<PropertyValue> propertyValueList = propertyValueMapper.selectByExample(example);
		if(null != propertyValueList) {
			setProperty(propertyValueList);
		}
		
		return propertyValueList;
	}
	public void setProperty(List<PropertyValue> propertyValueList) {
		for(PropertyValue propertyValue : propertyValueList) {
			setProperty(propertyValue);
		}
	}
	public void setProperty(PropertyValue propertyValue) {
		Property property = propertyService.selectById(propertyValue.getPropertyId());
		propertyValue.setProperty(property);
	}
	@Override
	public void addPropertyValue(PropertyValue propertyValue) {
		propertyValueMapper.insert(propertyValue);
	}
	@Override
	public String selectIsValueNull(Integer propertyId) {
		PropertyValueExample example = new PropertyValueExample();
		example.or().andPropertyIdEqualTo(propertyId);
		List<PropertyValue> propertyValueList = propertyValueMapper.selectByExample(example);
		String value = null;
		if(!propertyValueList.isEmpty()) {
			value = propertyValueList.get(0).getValue();
		}
		
		return value;
	}

}
