package com.my12306.controller.user;
import java.util.Random;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import com.my12306.po.user.User;
import com.my12306.service.user.LoginService;
import com.my12306.seivice.impl.user.LoginServiceImpl;
@SuppressWarnings("unused")
@Controller
public class RegeditController {
	static String num=String.valueOf(new Random().nextInt(999999));	
	@RequestMapping("regedit.do")
	public ModelAndView Regedit(@ModelAttribute User user,HttpSession session,HttpServletRequest request){
		ModelAndView model=new ModelAndView();
		//model.addObject(attributeName, attributeValue);				
		LoginService ls=new LoginServiceImpl();
		
		ls.addUser(user);
		
		return model;
	}
	@RequestMapping("/yanzhengma")
	@ResponseBody
	public String yanzheng(HttpSession session,String tel){
		System.out.println(num);
		if(tel.equals("num")){
			return "accept";
		}else
			return "unaccept";		
	}
	@RequestMapping("/ifcunzai")
	@ResponseBody
	public String cunzai(String tel){
		return null;
	}
	
}