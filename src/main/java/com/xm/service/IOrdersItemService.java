package com.xm.service;

import java.util.List;

import com.xm.pojo.Orders;
import com.xm.pojo.OrdersItem;

public interface IOrdersItemService {
	
	/**添加订单详情(无字段用null填充)
	 * @param ordersItem
	 */
	void insertordersItem(OrdersItem ordersItem);

	/**添加订单详情(无字段用default填充)
	 * @param ordersItem
	 */
	void insertordersItemSelective(OrdersItem ordersItem);

	/**通过用户id查询出对应的订单详情
	 * @param userId
	 * @return
	 */
	List<OrdersItem> queryOrdersItemByUsersIdAndOrderIdNull(Integer userId);
	
	/**修改订单详情(无字段用default填充)
	 * @param ordersItem
	 */
	void updateOrdersItemSelective(OrdersItem ordersItem);

	/**通过ordersItemId查询对应的订单详情
	 * @param ordersItemId
	 */
	OrdersItem selectByordersItemId(Integer ordersItemId);

	/**通过ordersId查询对应的订单详情
	 * @param id
	 * @return
	 */
	List<OrdersItem> selectByOrdersId(Integer id);

	/**通过ordersId查询对应的OrdersItem，并setOrders的totalMoney和totalNumber
	 * @param ordersList
	 */
	void setParmas(List<Orders> ordersList);

}
