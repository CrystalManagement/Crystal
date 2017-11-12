package com.base.weixin.api;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.base.common.util.ConfigUtil;

public class TemplateMessageFactory {
	
	public static TemplateMessage getTemplate(String openid,String template_id, String url, Miniprogram miniprogram) {
		if (template_id == ConfigUtil.getValue("sop")) {
			Map<String, Object> datamap = Data.getData();
			TemplateMessage templateMessage = Data.getTemplateMessage(openid,
					template_id, url, miniprogram, datamap);
			return templateMessage;

		} else if (template_id == ConfigUtil.getValue("ssoo")) {
			Map<String, Object> datamap = Data.getData2();
			TemplateMessage templateMessage = Data.getTemplateMessage(openid,
					template_id, url, miniprogram, datamap);
			return templateMessage;

		} else {
			System.out.println("没有此模板信息");
			return null;
		}
	}
}
