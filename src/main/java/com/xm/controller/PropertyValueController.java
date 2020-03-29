package com.xm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.xm.pojo.Product;
import com.xm.pojo.Property;
import com.xm.pojo.PropertyValue;
import com.xm.service.IProductService;
import com.xm.service.IPropertyService;
import com.xm.service.IPropertyValueService;

@Controller
@RequestMapping("/propertyValue")
public class PropertyValueController {
	
	@Autowired
	IPropertyValueService propertyValueService;
	
	@Autowired
	IPropertyService propertyService;
	
	@Autowired
	IProductService productService;
	
	/**使用property作为分页处理，propertyValue用作数据显示
	 * @param model
	 * @param pageNum
	 * @param pageSize
	 * @param productId
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/propertyValueList")
	public String productPropertyUpdatePage(Model model,@RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize,Integer productId, Integer categoryId) {
		//分页查询
		List<Property> propertyList = propertyService.selectByCid(pageNum, pageSize, categoryId);
		Product product = productService.selectProductById(productId);
		if(null != propertyList) {
			PageInfo<Property> pageInfo = new PageInfo<Property>(propertyList);
			List<PropertyValue> propertyValueList = propertyValueService.queryPropertyValueById(productId);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("propertyValueList", propertyValueList);
		}
		model.addAttribute("product", product);
		model.addAttribute("categoryId", categoryId);
		
		return "admin/propertyValue-list";
	}
	
	@RequestMapping("/propertyValueAdd")
	@ResponseBody
	public String propertyValueAdd(PropertyValue propertyValue, Integer categoryId) {
		String value = propertyValueService.selectIsValueNull(propertyValue.getPropertyId());
		if(null != value && !value.equals("")) {
			return "false";
		}
		
		propertyValueService.addPropertyValue(propertyValue); 
		
		return "true";
	}
	
}
