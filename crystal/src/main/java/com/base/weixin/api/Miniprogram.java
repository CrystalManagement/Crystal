package com.base.weixin.api;

import java.util.LinkedHashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public class Miniprogram {
	private String appid;
	private String pagepath;

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getPagepath() {
		return pagepath;
	}

	public void setPagepath(String pagepath) {
		this.pagepath = pagepath;
	}

	public static void main(String[] args) {
		Miniprogram m = new Miniprogram();
		m.setAppid("das");
		m.setPagepath("dsada");
		System.out.println(JSONObject.toJSONString(m));
		Map<String, Object> map = new LinkedHashMap<>();
		map.put("miniprogram", m);
		System.out.println(JSONObject.toJSONString(map));
	}
}
