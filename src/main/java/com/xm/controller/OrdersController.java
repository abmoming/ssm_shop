package com.xm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	
	@RequestMapping("/ordersList")
	public String ordersList() {
		return "admin/orders-list";
	}
	
}
