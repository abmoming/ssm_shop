package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.mapper.OrdersMapper;
import com.xm.pojo.Orders;
import com.xm.pojo.OrdersExample;
import com.xm.pojo.OrdersItem;

@Service
public class OrdersServiceImpl implements IOrdersService {
	@Autowired
	OrdersMapper ordersMapper;
	
	@Autowired
	IOrdersItemService ordersItemService;

	@Override
	public float insertOrders(Orders orders, List<OrdersItem> ordersItemList){
		ordersMapper.insert(orders);
		
		float totalMoney = 0.0f;
		for(OrdersItem ordersItem : ordersItemList) {
			ordersItem.setOrdersId(orders.getId());
			ordersItemService.updateOrdersItemSelective(ordersItem);
			totalMoney += ordersItem.getProduct().getPrice() * ordersItem.getNumber();
		}
		
		return totalMoney;
	}

	@Override
	public Orders selectByOid(Integer ordersId) {
		Orders orders = ordersMapper.selectByPrimaryKey(ordersId);
		
		return orders;
	}

	@Override
	public void updateOrders(Orders orders) {
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	@Override
	public List<Orders> queryOrdersByUsersId(Integer id, String delete) {
		OrdersExample example = new OrdersExample();
		example.or().andUsersIdEqualTo(id).andStatusNotEqualTo(delete);
		example.setOrderByClause("create_date desc");
		
		List<Orders> ordersList = ordersMapper.selectByExample(example);
		
		return ordersList;
	}
	
}
