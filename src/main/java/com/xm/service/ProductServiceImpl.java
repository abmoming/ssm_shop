package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.xm.mapper.ProductMapper;
import com.xm.pojo.Category;
import com.xm.pojo.Product;
import com.xm.pojo.ProductExample;

@Service
public class ProductServiceImpl implements IProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	IReviewService reviewService;

	@Override
	public Product selectProductById(Integer product_id) {
		Product product = productMapper.selectByPrimaryKey(product_id);
		if(null != product) {
			setProductReviewCount(product);
		}
		return product;
	}
	public void setProductReviewCount(Product product) {
		Integer count = reviewService.queryReviewCount(product.getId());
		product.setProductReviewCount(count);
	}
	@Override
	public List<Product> queryProductByCategoryId(Integer category_id) {
		ProductExample example = new ProductExample();
		example.or().andCategoryIdEqualTo(category_id);
		
		List<Product> productList = productMapper.selectByExample(example);
		
		return productList;
	}
	@Override
	public void setProductListByCategoryId(List<Category> categoryList) {
		for(Category category : categoryList) {
			List<Product> productList = queryProductByCategoryId(category.getId());
			if(null == productList && productList.size() == 0) {
				continue;
			}
			category.setProductList(productList);
		}
		
	}
	@Override
	public List<Product> queryAllProductByCid(Integer pageNum, Integer pageSize, Integer categoryId) {
		ProductExample example = new ProductExample();
		example.or().andCategoryIdEqualTo(categoryId);
		
		PageHelper.startPage(pageNum, pageSize);
		List<Product> productList = productMapper.selectByExample(example);
		
		return productList;
	}
	@Override
	public void saveProduct(Product product) {
		productMapper.insertSelective(product);
	}
	@Override
	public void updateByProductIdSelective(Product product) {
		 productMapper.updateByPrimaryKeySelective(product); 
	}
	@Override
	public void deleteProductById(Integer[] productIds) {
		
		productMapper.updateByProductIdsSelectiveSetStatus2Zero(productIds);
	}
	@Override
	public void saveOpenProduct(Integer[] productIds) {
		
		productMapper.updateByProductIdsSelectiveSetStatus2One(productIds);
	}

}
