package com.base.weixin.api;

import java.util.Map;

public class TemplateMessage {
	// 接收者openid
	private String touser;

	// 模板id
	private String template_id;

	// 模板跳转链接
	private String url;

	// 跳小程序所需数据，不需跳小程序可不用传该数据
	private Miniprogram miniprogram = new Miniprogram();

	// 所需跳转到的小程序appid
	private String appid;

	// 所需跳转到小程序的具体页面路径，支持带参数
	private String pagepath;

	// 模板数据
	private Map<String, Object> data;


	/**
	 * 注：url和miniprogram都是非必填字段，若都不传则模板无跳转；若都传，会优先跳转至小程序。
	 * 开发者可根据实际需要选择其中一种跳转方式即可。 当用户的微信客户端版本不支持跳小程序时，将会跳转至url。
	 * 
	 */
	public String getTouser() {
		return touser;
	}

	public void setTouser(String touser) {
		this.touser = touser;
	}

	public String getTemplate_id() {
		return template_id;
	}

	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Miniprogram getMiniprogram() {
		return miniprogram;
	}

	public void setMiniprogram(Miniprogram miniprogram) {
		this.miniprogram = miniprogram;
	}

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

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}



}
