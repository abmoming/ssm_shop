package com.xm.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.xm.mapper.PropertyMapper;
import com.xm.pojo.Property;
import com.xm.pojo.PropertyExample;

@Service
public class PropertyImpl implements IPropertyService {
	@Autowired
	PropertyMapper propertyMapper;
	
	@Override
	public Property selectById(Integer id) {
		Property property = propertyMapper.selectByPrimaryKey(id);
		
		return property;
	}

	@Override
	public List<Property> selectByCid(Integer pageNum,Integer pageSize,Integer cid) {
		PropertyExample example = new PropertyExample();
		example.or().andCategoryIdEqualTo(cid);
		
		PageHelper.startPage(pageNum, pageSize);
		List<Property> propertyList = propertyMapper.selectByExample(example);
		
		return propertyList;
	}

	@Override
	public void addProperty(Property property) {
		propertyMapper.insert(property);
	}

	@Override
	public void deletePropertyByIds(Integer[] propertyId) {
		List<Integer> propertyIdList = Arrays.asList(propertyId);
		PropertyExample example = new PropertyExample();
		example.or().andIdIn(propertyIdList);
		
		propertyMapper.deleteByExample(example);
	}

}
