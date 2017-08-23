package com.my12306.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mchange.net.SocketUtils;
import com.my12306.po.user.User;
import com.my12306.po.user.UserInfo;
import com.my12306.po.user.UserTotal;
import com.my12306.seivice.impl.user.LoginServiceImpl;
import com.my12306.seivice.impl.user.QueryUserInfoServiceImpl;
import com.my12306.seivice.impl.user.UserInfoServiceImpl;
import com.my12306.service.user.LoginService;
import com.my12306.service.user.QueryUserInfoService;
import com.my12306.service.user.UserInfoService;
import com.my12306.util.GetUUID;

@Controller
public class UserController{
	@RequestMapping(value="default.do")
	public String defaults(Model model,@ModelAttribute User user,HttpSession session){
		if(session.getAttribute("user")!=null){
			User user1=(User)session.getAttribute("user");
			
			System.out.println(user1.toString());
			/*System.out.println(session.getAttribute("user"));
			User users=(User) session.getAttribute("user");
			System.out.println(users.toString());
			QueryUserInfoService query=new QueryUserInfoServiceImpl();
			String res=query.query(users);
			System.out.println(res);
			if(res.equals("null"))
				return "pages/res/insert";*/
			return "welcome";
		}else
		return "welcome";		
	}
	
	
	
	@RequestMapping(value = "test.do", method = RequestMethod.POST)	
	@ResponseBody
	public String sent(Model model,@ModelAttribute User user,HttpSession session){
		LoginServiceImpl login=new LoginServiceImpl();
		System.out.println(user.getUsername());
		String result=login.getLoginResult(user);
		if(result.equals("success")){
			return "success";
		}else{
			System.out.println(result);
			model.addAttribute("result", result);
			return "error";
		}	
	}
	@ResponseBody
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String submit(HttpServletRequest request,HttpSession session){
		User user=new User();
		user.setUsername(request.getParameter("username"));
		user.setPasswd(request.getParameter("passwd"));
		LoginService login=new LoginServiceImpl();
		System.out.println(user.toString());
		String result=login.getLoginResult(user);
		if(result.equals("success")){
			user=login.getUser(user);
			session.setAttribute("user", user);
			return "success";
		}else{
			
			return result;
		}	
	}
	@RequestMapping(value = "regeditsubmit.do", method = RequestMethod.POST)
	public ModelAndView regedit(@ModelAttribute UserTotal ut){
		ModelAndView m=new ModelAndView();
		System.out.println(ut.toString());
		UserInfoService us=new UserInfoServiceImpl();
		LoginService uss=new LoginServiceImpl();
		User user=new User(ut.getUsername(),ut.getPasswd(),GetUUID.getuuid());
		System.out.println(user.toString());
		UserInfo userinfo=new UserInfo(user.getUserid(),ut.getTel(),ut.getName(),ut.getSex(),ut.getId(),ut.getAge());
		System.out.println(userinfo.toString());
		try {
			uss.addUser(user);
			us.check(userinfo);
			us.insertnew(userinfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		m.setViewName("redirect:default.do");
		return m;
	}
}
