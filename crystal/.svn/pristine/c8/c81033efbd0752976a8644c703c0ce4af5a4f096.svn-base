package com.base.weixin.api;

import java.awt.List;
import java.io.IOException;
import java.net.URL;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.base.common.util.ConfigUtil;
import com.base.common.util.HttpUtil;

public class WeixinApiExt extends WeixinApi {
	private static final String POST = "POST";
	private static final String GET = "GET";
	private static final String APPID = ConfigUtil.getValue("appID");
	private static final String SECRET = ConfigUtil.getValue("appsecret");
	private static final String CHARSET = ConfigUtil.getValue("charset");
	private static TemplateIdResult tir;

	// 获取模板id
	private static final String POST_TEMPLATE_ID = "https://api.weixin.qq.com/cgi-bin/template/api_add_template?access_token=%s";

	public static TemplateIdResult getTemplateId(
			String templateId_short) throws Exception {
		AccessToken token = new AccessToken();
		String jsonRequest = JSONObject.toJSONString(templateId_short);
		String jsonResult = HttpUtil.sendHttpReq(
				String.format(POST_TEMPLATE_ID, token.getAccess_token()), POST,
				jsonRequest, CHARSET);
		System.out.println(jsonResult);
		tir = JSONObject.parseObject(jsonResult, TemplateIdResult.class);
		System.out.println(tir.getTemplate_id());
		return tir;
	}

	// 获取所有模板
	private static final String GET_TEMPLATE = "https://api.weixin.qq.com/cgi-bin/template/get_all_private_template?access_token=%s";

	public static String getAllTemplate() throws Exception {
		AccessToken token = WeixinApi.getAccessToken();
		String jsonRequest = JSONObject.toJSONString(token);
		String jsonResult = HttpUtil.sendHttpReq(
				String.format(GET_TEMPLATE, token.getAccess_token()), GET,
				jsonRequest, CHARSET);
		System.out.println(jsonResult);
		return jsonResult;
	}

	// 模板分割
	public static JSONObject jsonToBean(String json) {
		JSONObject ob = null;
		try {
			JSONArray array = new JSONArray();
			array.add(json);
			System.out.println(array);
			for (int i = 0; i < ((CharSequence) array).length(); i++) {
				System.out.println("2");
				ob = (JSONObject) array.get(i);
				System.out.println(ob);
				return ob;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ob;
	}

	// 发送模板信息
	private static final String POST_TEMPLATEMSG = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=%s";

	public static MessageResult sendTemplateMessage(
			TemplateMessage templateMessage) throws Exception {
		AccessToken token = WeixinApi.getAccessToken();
		String jsonRequest = JSONObject.toJSONString(templateMessage);
		System.out.println(jsonRequest);
		String jsonResult = HttpUtil.sendHttpReq(
				String.format(POST_TEMPLATEMSG, token.getAccess_token()), POST,
				jsonRequest, CHARSET);
		System.out.println(jsonResult);
		return JSONObject.parseObject(jsonResult, MessageResult.class);
	}

	// 测试方法
	public static void main(String[] args) {
		try {
//			getAllTemplate();
			TemplateMessage templateMessage = Data.getTemplateMessage(
					"oKwkowVse9WJrTbk1MxPOE8fgA3Q",
					ConfigUtil.getValue("ssoo"), null,null ,
					Data.getData());
			sendTemplateMessage(templateMessage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
