package com.xm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.xm.pojo.Category;
import com.xm.pojo.Product;
import com.xm.service.ICategoryService;
import com.xm.service.IProductService;
import com.xm.service.IPropertyService;
import com.xm.service.IPropertyValueService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	IProductService productService;
	
	@Autowired
	ICategoryService categoryService;
	
	@Autowired
	IPropertyService propertyService;
	
	@Autowired
	IPropertyValueService propertyValueService;
	
	/**查询所有产品
	 * @return
	 */
	@RequestMapping("/productList")
	public String productList(Model model, @RequestParam(required = true, defaultValue = "1") Integer pageNum, 
			@RequestParam(required = true, defaultValue = "5") Integer pageSize,Integer categoryId) {
		List<Product> productList = productService.queryAllProductByCid(pageNum,pageSize,categoryId);
		
		//pageinfo相当于一个分页bean
		PageInfo<Product> pageInfo = new PageInfo<Product>(productList);
		Category category = categoryService.selectById(categoryId);
		
		model.addAttribute("category", category);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/product-list";
	}
	
	/**跳转添加页面，处理category产品分类数据
	 * @param model
	 * @return
	 */
	@RequestMapping("/productAddPage")
	public String productAddPage(Model model, Integer categoryId) {
		Category category = categoryService.selectById(categoryId);
		
		model.addAttribute("category", category);
		
		return "admin/product-add";
	}
	
	/**添加产品
	 * @param product
	 * @return
	 */
	@RequestMapping("/productSave")
	public String productSave(Product product) {
		productService.saveProduct(product);
		int categoryId = product.getCategoryId();
		
		return "redirect:productList.action?categoryId=" + categoryId;
	}
	
	/**产品详情
	 * @param model
	 * @param productId
	 * @return
	 */
	@RequestMapping("/productInfoPage")
	public String productInfoPage(Model model, Integer productId) {
		Product product = productService.selectProductById(productId);
		Category category = categoryService.selectById(product.getCategoryId());
		
		model.addAttribute("product", product);
		model.addAttribute("category", category);
		
		return "admin/product-info";
	}
	
	/**跳转产品添加页
	 * @param model
	 * @param productId
	 * @return
	 */
	@RequestMapping("/productUpdatePage")
	public String productUpdatePage(Model model, Integer productId) {
		Product product = productService.selectProductById(productId);
		List<Category> categoryList = categoryService.queryCategory();
		
		
		model.addAttribute("product", product);
		model.addAttribute("categoryList", categoryList);
		
		return "admin/product-update";
	}
	
	/**修改产品信息
	 * @param product
	 * @return
	 */
	@RequestMapping("/productUpdate")
	public String productUpdate(Product product, Integer category_id) {
		productService.updateByProductIdSelective(product);
		
		return "redirect:productList.action?categoryId=" + category_id;
	}
	
	/**删除产品（产品下架）
	 * @param productId
	 * @return
	 */
	@RequestMapping("productDelete")
	public String productDelete(Integer productId[], Integer categoryId) {
		productService.deleteProductById(productId);
		return "redirect:productList.action?categoryId=" + categoryId;
	}
	
	/**产品上架
	 * @param productId
	 * @return
	 */
	@RequestMapping("productOpen")
	public String productOpen(Integer productId[], Integer categoryId) {
		productService.saveOpenProduct(productId);
		
		return "redirect:productList.action?categoryId=" + categoryId;
	}
	
}
