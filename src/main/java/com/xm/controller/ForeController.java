package com.xm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.xerces.internal.util.Status;
import com.xm.pojo.Category;
import com.xm.pojo.Orders;
import com.xm.pojo.OrdersItem;
import com.xm.pojo.Product;
import com.xm.pojo.PropertyValue;
import com.xm.pojo.Review;
import com.xm.pojo.Users;
import com.xm.service.ICategoryService;
import com.xm.service.IOrdersItemService;
import com.xm.service.IOrdersService;
import com.xm.service.IProductService;
import com.xm.service.IPropertyValueService;
import com.xm.service.IReviewService;
import com.xm.service.IUsersService;
import com.xm.util.StatusUtil;

@Controller
public class ForeController {

	@Autowired
	IUsersService usersService;

	@Autowired
	ICategoryService categoryService;

	@Autowired
	IProductService productService;

	@Autowired
	IReviewService reviewService;

	@Autowired
	IPropertyValueService propertyValueService;

	@Autowired
	IOrdersItemService ordersItemService;

	@Autowired
	IOrdersService ordersService;

	/**
	 * 访问网站首页需要显示的内容
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/home")
	public String homePage(HttpSession session) {
		List<Category> categoryList = categoryService.queryCategory();
		productService.setProductListByCategoryId(categoryList);

		session.setAttribute("categoryList", categoryList);

		return "index";
	}

	/**
	 * 登陆检查用户是否存在
	 * 
	 * @param session
	 * @param username
	 * @param password
	 * @return
	 */
	/*
	 * @RequestMapping("/login") public String checkUserExists(HttpSession session,
	 * String username, String password) { Users user =
	 * usersService.checkUserExists(username, password); if (null == user) { return
	 * "loginPage"; } session.setAttribute("user", user);
	 * 
	 * return "redirect:home.action"; }
	 */

	/**
	 * 用户注销
	 * 
	 * @param session
	 * @return
	 */
	/*
	 * @RequestMapping("/loginOut") public String loginOut(HttpSession session) {
	 * session.removeAttribute("user");
	 * 
	 * return "redirect:home.action"; }
	 */

	/**
	 * 点击商品，显示商品详情
	 * 
	 * @param model
	 * @param product_id
	 * @return
	 */
	@RequestMapping("/productDetail")
	public String productPage(Model model, Integer product_id) {
		Product product = productService.selectProductById(product_id);
		List<Review> reviewList = reviewService.querytReviewById(product_id);
		List<PropertyValue> propertyValueList = propertyValueService.queryPropertyValueById(product_id);

		model.addAttribute("product", product);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("propertyValueList", propertyValueList);

		return "product";
	}

	@RequestMapping("/buyNow")
	public String buyNow(HttpSession session, Integer productId, Integer number) {
		Product product = productService.selectProductById(productId);
		Users user = (Users) session.getAttribute("user");
		if (null == user) {
			return "redirect:loginPage.action";
		}
		List<OrdersItem> ordersItemList = ordersItemService.queryOrdersItemByUsersIdAndOrderIdNull(user.getId());
		boolean flag = true;
		int ordersItemId = 0;
		if (null != ordersItemList) {
			for (OrdersItem ordersItem : ordersItemList) {
				if (ordersItem.getProductId().intValue() == product.getId().intValue()) {
					ordersItem.setNumber(ordersItem.getNumber() + number);
					ordersItemService.updateOrdersItemSelective(ordersItem);
					ordersItemId = ordersItem.getId();
					flag = false;
					break;
				}
			}
		}

		if (flag) {
			OrdersItem ordersItem = new OrdersItem();
			ordersItem.setProductId(productId);
			ordersItem.setUsersId(user.getId());
			ordersItem.setNumber(number);
			ordersItemService.insertordersItem(ordersItem);
			ordersItemId = ordersItem.getId();
		}

		return "redirect:buyPage.action?ordersItemId=" + ordersItemId;
	}

	@RequestMapping("/checkLogin")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if (null == user) {
			return "fail";
		}

		return "success";
	}

	@RequestMapping("/addCart")
	@ResponseBody
	public String addCart(HttpSession session, Integer productId, Integer number) {
		Product product = productService.selectProductById(productId);
		Users user = (Users) session.getAttribute("user");

		List<OrdersItem> ordersItemList = ordersItemService.queryOrdersItemByUsersIdAndOrderIdNull(user.getId());
		boolean flag = true;
		if (null != ordersItemList) {
			for (OrdersItem ordersItem : ordersItemList) {
				if (ordersItem.getProductId().intValue() == product.getId().intValue()) {
					ordersItem.setNumber(ordersItem.getNumber() + number);
					ordersItemService.updateOrdersItemSelective(ordersItem);
					flag = false;
					break;
				}
			}
		}

		if (flag) {
			OrdersItem ordersItem = new OrdersItem();
			ordersItem.setProductId(productId);
			ordersItem.setUsersId(user.getId());
			ordersItem.setNumber(number);
			ordersItemService.insertordersItem(ordersItem);
		}

		return "success";
	}

	@RequestMapping("/cart")
	public String cartPage(HttpSession session, Model model) {
		Users user = (Users) session.getAttribute("user");

		List<OrdersItem> ordersItemList = ordersItemService.queryOrdersItemByUsersIdAndOrderIdNull(user.getId());

		model.addAttribute("ordersItemList", ordersItemList);

		return "cart";
	}

	@RequestMapping("/buyPage")
	public String buyPage(HttpSession session, Model model, Integer[] ordersItemId) {
		List<OrdersItem> ordersItemList = new ArrayList<>();
		float totalMoney = 0;
		for (Integer oItemId : ordersItemId) {
			OrdersItem ordersItem = ordersItemService.selectByordersItemId(oItemId);
			totalMoney += ordersItem.getProduct().getPrice() * ordersItem.getNumber().intValue();
			ordersItemList.add(ordersItem);
		}

		model.addAttribute("totalMoney", totalMoney);
		session.setAttribute("ordersItemList", ordersItemList);

		return "buyPage";
	}

	@RequestMapping("/createOrders")
	public String createOrder(HttpSession session, Orders orders) {
		Users user = (Users) session.getAttribute("user");
		Date createOrdersTime = new Date();
		String creteOrdersCore = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(createOrdersTime);
		orders.setOrdersCode(creteOrdersCore);
		orders.setCreateDate(createOrdersTime);
		orders.setUsersId(user.getId());
		orders.setStatus(StatusUtil.WAITPAY);

		List<OrdersItem> ordersItemList = (List<OrdersItem>)session.getAttribute("ordersItemList");

		float totalMoney = ordersService.insertOrders(orders, ordersItemList);

		Integer ordersId = orders.getId();

		return "redirect:alipayPage.action?ordersId=" + ordersId + "&totalMoney=" + totalMoney;
	}

	@RequestMapping("/payedPage")
	public String payedPage(Model model, Integer ordersId) {
		Orders orders = ordersService.selectByOid(ordersId);

		orders.setPayDate(new Date());
		orders.setStatus(StatusUtil.WAITDELIVERY);

		ordersService.updateOrders(orders);

		model.addAttribute("orders", orders);

		return "payed";
	}

	@RequestMapping("/boughtPage")
	public String boughtPage(HttpSession session, Model model) {
		Users user = (Users) session.getAttribute("user");
		List<Orders> ordersList = ordersService.queryOrdersByUsersId(user.getId(), StatusUtil.DELETE);
		if (null != ordersList) {
			ordersItemService.setParmas(ordersList);
		}

		model.addAttribute("ordersList", ordersList);

		return "bought";
	}
	
	@RequestMapping("/deleteOrders")
	@ResponseBody
	public String deleteOrders(Integer ordersId) {
		Orders orders = ordersService.selectByOid(ordersId);
		if(null == orders) {
			return "fail";
		}
		
		orders.setStatus(StatusUtil.DELETE);
		ordersService.updateOrders(orders);
		
		return "success";
	}

}
