package com.base.weixin.api;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.base.common.util.ConfigUtil;
import com.fasterxml.classmate.util.ResolvedTypeCache.Key;

public class Data {

	public static Map<String, Object> getMiniprogram() {
		HashMap<String, Object> miniprogram = new LinkedHashMap<>();
		Miniprogram miniprogram2 = new Miniprogram();
		miniprogram2.setAppid(ConfigUtil.getValue("miniprogramAPP"));
		miniprogram2.setPagepath(ConfigUtil.getValue("miniprogramPagePath"));
		miniprogram.put("appid", miniprogram2.getAppid());
		miniprogram.put("pagepath", miniprogram2.getPagepath());
		return miniprogram;
	}

	public static Map<String, Object> getData() {
		// ServiceServiceImp ssImp = new ServiceServiceImp();
		HashMap<String, Object> data = new LinkedHashMap<String, Object>();
		Map<String, String> first = new LinkedHashMap<String, String>();
		Map<String, String> keyword1 = new LinkedHashMap<String, String>();
		Map<String, String> remark = new LinkedHashMap<String, String>();
		first.put("value", "");
		first.put("color", ConfigUtil.getValue("color"));
		data.put("first", first);
		keyword1.put("value", "zxcvxc");
		keyword1.put("color", ConfigUtil.getValue("color"));
		data.put("keyword1", keyword1);
		remark.put("value", "zcvcxv");
		remark.put("color", ConfigUtil.getValue("color"));
		data.put("remark", remark);
		return data;
	}

	public static Map<String, Object> getData2() {
		HashMap<String, Object> data = new LinkedHashMap<String, Object>();
		Map<String, String> first = new LinkedHashMap<String, String>();
		Map<String, String> keyword1 = new LinkedHashMap<String, String>();
		Map<String, String> keyword2 = new LinkedHashMap<String, String>();
		Map<String, String> remark = new LinkedHashMap<String, String>();
		first.put("value", "ddd");
		first.put("color", ConfigUtil.getValue("color"));
		data.put("first", first);
		keyword1.put("value", "d");
		keyword1.put("color", ConfigUtil.getValue("color"));
		data.put("keyword1", keyword1);
		keyword2.put("value", "");
		keyword2.put("color", ConfigUtil.getValue("color"));
		data.put(ConfigUtil.getValue("backupFieldName"), keyword2);
		remark.put("value", "zasd");
		remark.put("color", ConfigUtil.getValue("color"));
		data.put("remark", remark);
		return data;

	}
	
//	public static Map<String, Object> getData3(){
//		Keyword ky = new Keyword();
//		HashMap<String, Object> map = new LinkedHashMap<>();
//		ky.setValue("");
//		ky.setColor(ConfigUtil.getValue("color"));
//		map.put("first", ky);
//		ky.setValue("qwe");
//		map.put("keyword1", ky);
//		ky.setValue("85555555");
//		map.put("remark", ky);
//		return map;
//	}

	public static TemplateMessage getTemplateMessage(String openid,
			String template_id, String url, Miniprogram miniprogram,
			Map<String, Object> data) {
		TemplateMessage templateMessage = new TemplateMessage();
		templateMessage.setTouser(openid);
		templateMessage.setTemplate_id(template_id);
		templateMessage.setUrl(url);
		templateMessage.setMiniprogram(miniprogram);
		templateMessage.setData(data);
		return templateMessage;
	}

	
	public static void main(String[] args) {
		System.out.println(JSONObject.toJSONString(getData()));
		System.out.println(JSONObject.toJSONString(getData2()));
	}

}
