package com.my12306.controller.user;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import com.my12306.util.GetImg;
@Controller
public class GetImgController{
	 	@RequestMapping(value = "captcha.do", method = RequestMethod.GET)
	    @ResponseBody
	    public void captcha(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException 
	    {
	        GetImg.outputCaptcha(request, response);
	    }
	 	@RequestMapping(value = "yanzheng.do", method = RequestMethod.GET)
	    @ResponseBody
	    public String getres(){	 		
	 		return GetImg.res();
	 	}
	 	@RequestMapping(value = "getcal.do", method = RequestMethod.GET)
	    @ResponseBody
	    public void getcal(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException 
	    {
	        GetImg.outputCaptcha(request, response);
	    }
	 	
}