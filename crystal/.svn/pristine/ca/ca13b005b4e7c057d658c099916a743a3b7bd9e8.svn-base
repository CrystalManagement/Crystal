package com.base.weixin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.base.user.domain.UserVO;
import com.base.user.service.UserService;
import com.base.weixin.api.Menu;
import com.base.weixin.api.MenuResult;
import com.base.weixin.api.Result;
import com.base.weixin.api.WeixinApi;

@RequestMapping("/weixin")
@Controller
public class WeixinMenuController {
	@Autowired
	private UserService userService;

	@RequestMapping("authorization")
	public String verify(HttpSession session) throws IOException {
		if (session.getAttribute("admin") == "true") {
			return "redirect:menu.action";
		} else {
			return "weixin/createmenu";
		}
	}

	@RequestMapping(value = "menu", method = RequestMethod.POST)
	public String menu(ModelMap map, String account, String password, HttpSession session) throws Throwable {
		UserVO user = userService.checkLogin(account, password);
		if (user!=null) {
			session.setAttribute("admin", "true");
			MenuResult result = WeixinApi.getMenu();
			if (result.getErrcode() == null && result.getErrmsg() == null) {
				Menu root = result.getMenu();
				map.addAttribute("menu", root);
				return "weixin/menu";
			} else {
				System.out.println(result.getErrcode() + "：" + result.getErrmsg());
				throw new IOException("获取菜单失败");
			}
		} else {
			return "redirect:authorization.action";
		}
	}

	@RequestMapping(value = "menu", method = RequestMethod.GET)
	public String showMenu(ModelMap map, HttpSession session) throws IOException {
		if (session.getAttribute("admin") == "true") {

			MenuResult result = WeixinApi.getMenu();
			if (result.getErrcode() == null && result.getErrmsg() == null) {
				Menu root = result.getMenu();
				map.addAttribute("menu", root);
				return "menu";
			} else {
				throw new IOException("获取菜单失败");
			}
		} else {
			return "redirect:authorization.action";
		}
	}

	@RequestMapping(value = "createmenu", method = RequestMethod.POST)
	public @ResponseBody String create(String menu, HttpServletRequest req) throws IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("admin") != null) {

			System.out.println(menu);
			Menu root = JSON.parseObject(menu, Menu.class);//

			Result result = WeixinApi.createMenu(root);
			if (result.getErrcode() == 0 && result.getErrmsg().equals("ok"))
				return "success";
			else {
				return "fail";
			}

		} else {
			System.out.println("please login");
			return "fail";
		}
	}
}
