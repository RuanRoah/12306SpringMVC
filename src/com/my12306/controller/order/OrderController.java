package com.my12306.controller.order;




import java.util.List;


import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my12306.seivice.impl.order.OrderServiceImpl;
import com.my12306.service.order.OrderService;
import com.my12306.vo.OrderShow;
import com.my12306.vo.TicketShow;
import com.my12306.po.order.Order;
import com.my12306.po.user.User;;

@Controller
public class OrderController {
	/**
	 * 购票
	 * @param 车次
	 * @param 乘车人姓名
	 * @author 阮航 ，张俊杰
	 * revise by高开锦，任则安，
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("buyTickets.do")
	/**/
	public String buyTickets(@RequestParam("train_name") String train_name,@RequestParam("human_name") List<String> human_name,HttpSession session){
        
		System.out.println("进入购票，乘车人为:");
		for (String string : human_name) {
			System.out.println(string);
		}
		
		OrderService  orderService = new OrderServiceImpl();
		
		List<TicketShow> ticketShows=(List<TicketShow>) session.getAttribute("ticketShows");
		
		/*String userid=(String)session.getAttribute("???");*/ //userid
		User u=(User)session.getAttribute("user");
		String userid=u.getUserid();
		System.out.println("用户选择的车次为:"+train_name);
		if(orderService.addOrder(userid,ticketShows,human_name,train_name)==1)
		
		{		
			System.out.println("1");
			return "订票成功！";
		}
		
		else{
			System.out.println("0");
			return "订票失败！";
		}
	}
	/**
	 * 退票
	 * @param 订单号
	 * @author 张俊杰
	 * revise by高开锦，任则安
	 */
	@ResponseBody
	@RequestMapping("refundTicket.do")//
	public String refundTicket(@RequestParam("orderid") String orderid){
		
		System.out.println("进入退票");
		
		OrderService  orderService = new OrderServiceImpl();
		int result=orderService.deleteOrder(orderid);	
		if(result==1){
			System.out.println("");	
			return "退票成功！";
		}
		else{
			return "退票失败！";
		}
		
	}
	
	/**
	 * 查看订单
	 * @author 张俊杰
	 * @param session
	 * revise 高开锦
	 * release 阮航
	 */
	@RequestMapping("showOrder.do")
	public ModelAndView showOrder(HttpSession session){
		
		ModelAndView m=new ModelAndView();
		String userid=(String)session.getAttribute("user");//userid		
		System.out.println(userid);
		OrderService  orderService = new OrderServiceImpl();
		List<OrderShow> orderShows=orderService.showUserOrderInfo(userid);
		for (OrderShow orderShow : orderShows) {
			System.out.println(orderShow);
		}		
		m.addObject("orderShows", orderShows);
		m.setViewName("");		
		return m;
	}
	
	@RequestMapping("updateOrder.do")
	@ResponseBody
	public String updateOrder(@RequestParam("train_name") String train_name,@RequestParam("human_name") String human_name,HttpSession session){
		System.out.println("改签");
		User u=(User)session.getAttribute("user");
		OrderServiceImpl  os = new OrderServiceImpl();
		List<TicketShow> ts=(List<TicketShow>) session.getAttribute("ticketShows");
		System.out.println(ts.size());
		/*orderService.*/
		Integer res=os.updateOrder(u.userid, ts, human_name, train_name);
		String s=String.valueOf(res);
		return s;		
	}
	
	@RequestMapping("deleteOrder.do")
	@ResponseBody
	public String deleteOrder(@RequestParam("orderid") String orderid){
		System.out.println("退票"+orderid);
		OrderServiceImpl  os = new OrderServiceImpl();
		Integer res=os.deleteOrder(orderid);
		String s=String.valueOf(res);
		return s;			
	}
	@RequestMapping("gotogaiqian.do")
	public ModelAndView gotoOrder(HttpSession session){
		ModelAndView test=new ModelAndView();
		test.setViewName("pages/newTickets");
		return test;
	}	
}