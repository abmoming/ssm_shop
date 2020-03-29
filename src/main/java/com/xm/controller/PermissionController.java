package com.xm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.xm.pojo.Permission;
import com.xm.service.IPermissionService;

@Controller
@RequestMapping("/permission")
public class PermissionController {
	
	@Autowired
	IPermissionService permissionService;
	
	/**分页查询所有资源权限
	 * @param pageNum
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/permissionList")
	public String permissionList(@RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize,Model model) {
		
		List<Permission> permissions = permissionService.queryAllPermission(pageNum,pageSize);
//		PageInfo<Permission> pageInfo = new PageInfo<Permission>(permissions);
		PageInfo<Permission> pageInfo = PageInfo.of(permissions);
		
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/permission-list";
	}
	
	/**添加资源权限
	 * @param permission
	 * @return
	 */
	@RequestMapping("/permissionAdd")
	public String permissionAdd(Permission permission) {
		permissionService.addPermission(permission);
		
		return "redirect:permissionList.action";
	}
	
	
}
