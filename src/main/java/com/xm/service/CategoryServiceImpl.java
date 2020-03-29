package com.xm.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.xm.mapper.CategoryMapper;
import com.xm.pojo.Category;
import com.xm.pojo.CategoryExample;
import com.xm.pojo.Product;


@Service
public class CategoryServiceImpl implements ICategoryService {
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Autowired
	IProductService productService;

	
	@Override
	public List<Category> queryCategory() {
		List<Category> categoryList = categoryMapper.selectByExample(null);
		
		return categoryList;
	}

	@Override
	public List<Product> queryProductByCategoryId(Integer id) {
		List<Product> productList = productService.queryProductByCategoryId(id);
		
		return productList;
	}

	@Override
	public Category selectById(Integer categoryId) {
		Category category = categoryMapper.selectByPrimaryKey(categoryId);
		
		return category;
	}

	@Override
	public List<Category> queryCategory(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Category> categoryList = categoryMapper.selectByExample(null);
		
		return categoryList;
	}

	@Override
	public void addCategory(Category category) {
		categoryMapper.insert(category);
	}

	@Override
	public void deleteCategoryByIds(Integer[] categoryId) {
		List<Integer> categoryIdList = Arrays.asList(categoryId);
		CategoryExample example = new CategoryExample();
		example.or().andIdIn(categoryIdList);
		
		categoryMapper.deleteByExample(example);
	}

	@Override
	public void updateCategoryById(Category category) {
		categoryMapper.updateByPrimaryKey(category);
	}

}
