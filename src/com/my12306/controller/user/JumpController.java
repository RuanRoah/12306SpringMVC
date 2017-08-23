package com.my12306.controller.user;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.my12306.po.user.User;
import com.my12306.po.user.UserPeople;
import com.my12306.po.user.UserInfo;
import com.my12306.seivice.impl.user.UserInfoServiceImpl;
import com.my12306.seivice.impl.user.UserPeopleServiceImpl;
import com.my12306.service.user.UserInfoService;
import com.my12306.service.user.UserPeopleService;
@Controller
public class JumpController {
	@RequestMapping("userinfo.do")
	public ModelAndView UserInfo(Model model,HttpSession session){
		User u=(User) session.getAttribute("user");
		ModelAndView m=new ModelAndView();
		if(session.getAttribute("user")==null){
			m.setViewName("redirect:default.do");
			return m;
		}else{
			UserInfoService ups=new UserInfoServiceImpl(); 			
			UserInfo ui=new UserInfo();	
			ups.search(u.getUserid());
			//System.out.println(ui);
			m.addObject("userpeople", ui);
			m.setViewName("pages/PersonalInformation");		
		}
		
		return m;
	}
	@RequestMapping("information.do")
	public ModelAndView Information(){
		ModelAndView m=new ModelAndView();
		m.setViewName("pages/InformationService");		
		return m;
	}
	@RequestMapping("order.do")
	public ModelAndView Order(){
		ModelAndView m=new ModelAndView();
		m.setViewName("pages/PurchaseService");		
		return m;
	}
	@RequestMapping("register.do")
	public ModelAndView register(){
		ModelAndView m=new ModelAndView();
		m.setViewName("register");
		return m;
	}
	
}