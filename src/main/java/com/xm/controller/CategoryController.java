package com.xm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.xm.pojo.Category;
import com.xm.service.ICategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Resource
	ICategoryService categoryService;
	
	/**产品分类列表
	 * @param model
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/categoryList")
	public String categoryList(Model model,@RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize) {
		List<Category> categoryList = categoryService.queryCategory(pageNum,pageSize);
		PageInfo<Category> pageInfo = new PageInfo<Category>(categoryList);
		
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/category-list";
	}
	
	/**添加产品分类
	 * @param category
	 * @return
	 */
	@RequestMapping("/categoryAdd")
	public String categoryAdd(Category category) {
		categoryService.addCategory(category);
		
		return "redirect:categoryList.action";
	}
	
	/**删除或批量删除产品分类
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/categoryDelete")
	public String categoryDelete(Integer[] categoryId) {
		categoryService.deleteCategoryByIds(categoryId);
		
		return "redirect:categoryList.action";
	}
	
	/**预存当前点击的产品分类信息，跳转到产品分类编辑页
	 * @param model
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/categoryUpdatePage")
	public String categoryUpdatePage(Model model, Integer categoryId) {
		Category category = categoryService.selectById(categoryId);
		
		model.addAttribute("category", category);
		
		return "admin/category-update";
	}
	
	/**修改分类
	 * @param category
	 * @return
	 */
	@RequestMapping("/categoryUpdate")
	public String categoryUpdate(Category category) {
		categoryService.updateCategoryById(category);
		
		return "redirect:categoryList.action";
	}
	
}
