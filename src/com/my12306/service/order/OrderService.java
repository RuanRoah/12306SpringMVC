package com.my12306.service.order;


import java.util.List;
import com.my12306.vo.OrderShow;
import com.my12306.vo.TicketShow;

public interface OrderService {

	/**
	 * 添加订单
	 */
	public int addOrder(String userid,List<TicketShow> list,List<String> human_name,String trainName);
	
	/**
	 * 删除订单
	 */
	public int deleteOrder(String orderId);
	
	/**
	 * 查看订单
	 */
	public List<OrderShow> showUserOrderInfo(String userid);
	
	
}
