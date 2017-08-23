package com.my12306.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.my12306.po.user.User;
import com.my12306.po.user.UserInfo;
import com.my12306.po.user.UserPeople;
import com.my12306.seivice.impl.user.UserInfoServiceImpl;
import com.my12306.seivice.impl.user.UserPeopleServiceImpl;
import com.my12306.service.user.UserInfoService;
import com.my12306.service.user.UserPeopleService;
import com.my12306.util.GetUUID;

import net.sf.json.JSONObject;

@Controller
public class UserInfoController {
	@RequestMapping("touserinfo")
	@ResponseBody
	public String gotoUserInfo(HttpSession session){
		if(session.getAttribute("user")==null)
			return "failed";
		else
			return "redirect:default.do";		
	}
	@RequestMapping("toinfo")
	public String toUserInfo(HttpSession session,@ModelAttribute UserInfo userinfo){
		User users=(User)session.getAttribute("user");
		UserInfoService ui=new UserInfoServiceImpl();
		ui.check(userinfo);
				
		return "pages/res/insertinfo";
	}
	@RequestMapping("insertinfo")
	public String insertInfo(HttpSession session,@ModelAttribute UserInfo userinfo){
		User users=(User)session.getAttribute("user");
		UserInfoService ui=new UserInfoServiceImpl();
		ui.check(userinfo);
				
		return "redirect:default.do";
	}
	
	@RequestMapping("gotopeople")
	@ResponseBody
	public String getpeople(HttpSession session){
		User user=(User)session.getAttribute("user");				
			
		return "people";
	}
	
	@RequestMapping("updateinfo.do")
	public String douserinfo(HttpSession session,@ModelAttribute UserInfo userinfo){
		System.out.println(userinfo);
		UserInfoService uc=new UserInfoServiceImpl();
		
		uc.updatenew(userinfo);
		
		
		return "redirect:userinfo.do";
	}
	
	@ResponseBody
	@RequestMapping("dopeople.do")
	public String dopeople(HttpSession session,@ModelAttribute UserPeople userpeople){
		System.out.println("测试:"+userpeople.toString());
		String result="";
		User users=(User)session.getAttribute("user");
		UserPeopleService upc=new UserPeopleServiceImpl();
		
		//upc.querypeople(u);
		UserPeople newpeople=new UserPeople();
		
	
			newpeople=upc.search(userpeople);
			if(newpeople==null){
				userpeople.setId(GetUUID.getuuid());
				upc.insertpeople(userpeople);
				result="insert";
			}else{
				upc.updatepeople(userpeople);
				result="update";
			}
		
		
			return result;
		}
	@ResponseBody
	@RequestMapping("deletepeople.do")
	public String deletepeople(HttpSession session,@RequestParam("id") String id){
		String result="";
		UserPeopleService us=new UserPeopleServiceImpl();
		us.deletepeople(id);
		return "已删除";
	}
	
	
}