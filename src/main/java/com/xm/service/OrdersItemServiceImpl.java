package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.mapper.OrdersItemMapper;
import com.xm.pojo.Orders;
import com.xm.pojo.OrdersItem;
import com.xm.pojo.OrdersItemExample;
import com.xm.pojo.Product;

@Service
public class OrdersItemServiceImpl implements IOrdersItemService {
	
	@Autowired
	OrdersItemMapper ordersItemMapper;
	
	@Autowired
	IProductService productService;
	
	@Override
	public void insertordersItem(OrdersItem ordersItem) {
		ordersItemMapper.insert(ordersItem);
	}
	
	@Override
	public void insertordersItemSelective(OrdersItem ordersItem) {
		ordersItemMapper.insertSelective(ordersItem);
	}

	@Override
	public List<OrdersItem> queryOrdersItemByUsersIdAndOrderIdNull(Integer userId) {
		OrdersItemExample example = new OrdersItemExample();
		example.or().andUsersIdEqualTo(userId).andOrdersIdIsNull();
		List<OrdersItem> ordersItemList = ordersItemMapper.selectByExample(example);
		
		setProduct(ordersItemList);
		
		return ordersItemList;
	}
	public void setProduct(List<OrdersItem> ordersItemList) {
		for(OrdersItem ordersItem : ordersItemList) {
			setProduct(ordersItem);
		}
	}
	public void setProduct(OrdersItem ordersItem) {
		Product product = productService.selectProductById(ordersItem.getProductId());
		ordersItem.setProduct(product);
	}

	@Override
	public void updateOrdersItemSelective(OrdersItem ordersItem) {
		ordersItemMapper.updateByPrimaryKeySelective(ordersItem);
	}

	@Override
	public OrdersItem selectByordersItemId(Integer ordersItemId) {
		OrdersItem ordersItem = ordersItemMapper.selectByPrimaryKey(ordersItemId);
		setProduct(ordersItem);
		
		return ordersItem;
	}

	@Override
	public List<OrdersItem> selectByOrdersId(Integer id) {
		OrdersItemExample example = new OrdersItemExample();
		example.or().andOrdersIdEqualTo(id);
		List<OrdersItem> ordersItemList = ordersItemMapper.selectByExample(example);
		
		setProduct(ordersItemList);
		
		return ordersItemList;
	}

	@Override
	public void setParmas(List<Orders> ordersList) {
		for(Orders orders : ordersList) {
			float totalMoney = 0.0f;
			int totalNumber = 0;
			List<OrdersItem> ordersItemList = selectByOrdersId(orders.getId());
			for(OrdersItem ordersItem : ordersItemList) {
				totalMoney += ordersItem.getProduct().getPrice() * ordersItem.getNumber();
				totalNumber += ordersItem.getNumber();
			}
			
			orders.setTotalMoney(totalMoney);
			orders.setTotalNumber(totalNumber);
			orders.setOrdersItemList(ordersItemList);
		}
	}
	
	

}
