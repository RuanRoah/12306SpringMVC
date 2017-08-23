package com.my12306.controller.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DebugController {
	@RequestMapping("zhang.do")
	public String debugzhang(){
		return "pages/buyTicket";
	}
	@RequestMapping("ren.do")
	public String debugren(){
		return "";
	}
}
