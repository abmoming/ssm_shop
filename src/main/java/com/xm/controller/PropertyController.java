package com.xm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.xm.pojo.Category;
import com.xm.pojo.Property;
import com.xm.service.ICategoryService;
import com.xm.service.IPropertyService;

@Controller
@RequestMapping("/property")
public class PropertyController {
	@Autowired
	IPropertyService propertyService;
	
	@Autowired
	ICategoryService categoryService;
	
	/**通过条件cid=传过来的cid查询出该分类对应的属性(分页)
	 * @param pageNum
	 * @param pageSize
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/propertyList")
	public String propertyList(Model model,@RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize, Integer categoryId) {
		Category category = categoryService.selectById(categoryId);
		List<Property> propertyList = propertyService.selectByCid(pageNum,pageSize,category.getId());
		PageInfo<Property> pageInfo = null;
		if(!propertyList.isEmpty()) {
			pageInfo = new PageInfo<Property>(propertyList);
			model.addAttribute("pageInfo", pageInfo);
		}
		
		model.addAttribute("category", category);
		
		return "admin/property-list";
	}
	
	/**跳转到分类属性添加页
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/propertyAddPage")
	public String propertyAddPage(Model model,Integer categoryId) {
		model.addAttribute("categoryId", categoryId);
		
		return "admin/property-add";
	}
	
	/**添加分类属性，并重定向到所属该分类下的属性展示界面
	 * @param property
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/propertyAdd")
	public String propertyAdd(Property property, Integer categoryId) {
		property.setCategoryId(categoryId);
		propertyService.addProperty(property);
		
		return "redirect:propertyList.action?categoryId=" + categoryId;
	}
	
	/**删除分类属性
	 * @param propertyId
	 * @return
	 */
	@RequestMapping("/propertyDelete")
	public String propertyDelete(Integer[] propertyId, Integer categoryId) {
		propertyService.deletePropertyByIds(propertyId);
		
		return "redirect:propertyList.action?categoryId=" + categoryId;
	}
}
