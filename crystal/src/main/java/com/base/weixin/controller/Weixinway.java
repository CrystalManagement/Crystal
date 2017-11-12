package com.base.weixin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.base.weixin.api.AccessToken;
import com.base.weixin.api.UserInfo;
import com.base.weixin.api.WeixinApi;
import com.base.weixin.api.WeixinApi1;

@Controller
@RequestMapping("/weixinLog")
public class Weixinway {
	@RequestMapping("/erweima2")
	public void uerof(String code) throws Exception {
		System.out.println("code:"+code);
		String openid=WeixinApi.getOpenid(code);
		AccessToken token =WeixinApi.getAccessToken();
		
		UserInfo user=WeixinApi.getUserInfo(openid);
		System.out.println(user.getNickname());
		System.out.println(user.getHeadimgurl());
		
	}
}
