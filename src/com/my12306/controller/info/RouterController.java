package com.my12306.controller.info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.my12306.po.user.User;
import com.my12306.po.user.UserInfo;
import com.my12306.po.user.UserPeople;
import com.my12306.seivice.impl.order.OrderServiceImpl;
import com.my12306.seivice.impl.user.UserInfoServiceImpl;
import com.my12306.seivice.impl.user.UserPeopleServiceImpl;
import com.my12306.service.order.OrderService;
import com.my12306.service.user.UserInfoService;
import com.my12306.service.user.UserPeopleService;
import com.my12306.vo.OrderShow;
@Controller
public class RouterController {
	@RequestMapping("toorder.do")
	public ModelAndView getPersional(HttpSession session){
		ModelAndView m=new ModelAndView();
		User user=(User) session.getAttribute("user");
		OrderService os=new OrderServiceImpl();
		List<OrderShow> order=os.showUserOrderInfo(user.getUserid());
		System.out.println(order.size());
		
		m.addObject("order", order);
		m.setViewName("pages/info/Order");
		return m;
	}
	
	@RequestMapping("topeople.do")
	public ModelAndView getCustomer(HttpSession session){
		ModelAndView m=new ModelAndView();
		UserPeopleService ups=new UserPeopleServiceImpl(); 
		UserPeople up_1=new UserPeople();
		User user=(User) session.getAttribute("user");
		up_1.setUserid(user.getUserid());	
		ArrayList<UserPeople> up=ups.querypeople(up_1);
		m.addObject("userpeople", up);
		m.setViewName("pages/info/People");
		return m;
	}
		
	@RequestMapping("toinfo.do")
	public ModelAndView getuserinfo(HttpSession session){
		ModelAndView m=new ModelAndView();
		User user=(User) session.getAttribute("user");
		UserInfoService us=new UserInfoServiceImpl();
		UserInfo userinfo=new UserInfo();
		userinfo=us.search(user.getUserid());
		System.out.println(userinfo.toString());
		m.addObject("userinfo", userinfo);
		m.setViewName("pages/info/Info");
		return m;
	}
	
	@RequestMapping("result.do")
	public ModelAndView resultinfo(HttpSession session){
		ModelAndView m=new ModelAndView();
		m.setViewName("pages/res/result");
		return m;
	}
}