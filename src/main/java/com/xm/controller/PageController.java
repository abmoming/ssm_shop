package com.xm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}
	
	@RequestMapping("/alipayPage")
	public String payedPage() {
		return "alipay";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin/admin-index";
	}
	
	@RequestMapping("/users/usersAddPage")
	public String usersAddPage() {
		return "admin/users-add";
	}
	
	@RequestMapping("/role/roleAddPage")
	public String roleAddPage() {
		return "admin/role-add";
	}
	
	@RequestMapping("/permission/permissionAddPage")
	public String permissionAddPage() {
		return "admin/permission-add";
	}
	
	
}
