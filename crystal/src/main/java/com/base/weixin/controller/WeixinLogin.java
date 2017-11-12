package com.base.weixin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base.weixin.api.UserInfo;
import com.base.weixin.api.WeixinApi1;


@Controller
@RequestMapping("/weixinLog")
public class WeixinLogin {
	
/*	
	@RequestMapping("/wixinlogin")
	
	public ModelAndView login() throws Throwable {
		ModelAndView model = new ModelAndView("http://localhost:8080/fastssm/hanxi/loginAndResign.jsp");
		
			model.addObject("code", wx1.getCode());
		
		return model;
	}*/
	@RequestMapping("/erweima")
	public void uerof(String code) throws Exception {
		System.out.println("code:"+code);
		String openid=WeixinApi1.getAccessTokenAndOpendId(code).getOpenid();
		String access_token=WeixinApi1.getAccessTokenAndOpendId(code).getAccess_token();
		UserInfo user=WeixinApi1.getUserInfo(access_token, openid);
		System.out.println(user.getNickname());
		System.out.println(user.getHeadimgurl());
		
	}

}
