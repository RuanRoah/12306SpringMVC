package com.my12306.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ActionController {
	@RequestMapping(value="", method = RequestMethod.GET)
	public String updatepasswd(){
		
		return "redirect:userinfo.do";
	}
	public String insertpeople(){
		
		return "redirect:userinfo.do";
	}
	public String updateinfo(){
		
		return "redirect:userinfo.do";
	}
}