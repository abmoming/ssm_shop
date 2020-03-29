package com.xm.service;

import java.util.List;

import com.xm.pojo.Orders;
import com.xm.pojo.OrdersItem;

public interface IOrdersService {
	/**创建订单
	 * @param orders
	 * @param ordersItemList
	 */
	float insertOrders(Orders orders,List<OrdersItem> ordersItemList);

	/**通过oid查询出对应的order
	 * @param ordersId
	 * @return
	 */
	Orders selectByOid(Integer ordersId);

	/**修改订单Orders
	 * @param orders
	 */
	void updateOrders(Orders orders);

	/**通过用户id查询对应的订单
	 * @param id
	 * @param delete 
	 * @return
	 */
	List<Orders> queryOrdersByUsersId(Integer id, String delete);
	
}
