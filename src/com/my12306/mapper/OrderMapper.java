package com.my12306.mapper;


import java.util.List;

import com.my12306.po.order.Order;

public interface OrderMapper {
	
	/**
	 *通过订单号查找订单 
	 */
	public Order getOrderByOrderId(String orderId);
	/**
	 *查询某用户的全部订单 
	 */
	public List<Order> getOrderByUserId(String userId);
	/**
	 * 购票（增加订单）
	 */
	public int addOrder(Order order);
	
	/**
	 * 退票（删除订单）
	 */
	public int deleteOrder(String orderId);
	
	/**
	 * 改签（修改订单）
	 */
	public int updateOrder(Order order);
}
