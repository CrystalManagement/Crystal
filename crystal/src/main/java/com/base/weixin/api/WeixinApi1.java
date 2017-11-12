package com.base.weixin.api;

import java.io.IOException;

import com.alibaba.fastjson.JSONObject;
import com.base.common.util.ConfigUtil;
import com.base.common.util.HttpUtil;

public class WeixinApi1 {
	private static final Object LOCK = new Object();
	private static final String POST = "POST";
	private static final String GET = "GET";
	private static final String APPID = ConfigUtil.getValue("appID");
	private static final String SECRET = ConfigUtil.getValue("appsecret");
	private static final String CHARSET = ConfigUtil.getValue("charset");
	private static final String GET_TOKEN = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s";
	
	private static AccessToken token;

	public static AccessToken getAccessToken() throws IOException {
		if (token != null && !token.isExpired()) {
			return token;
		}
		synchronized (LOCK) {
			if (token != null && !token.isExpired()) {
				return token;
			}
			String jsonResult = HttpUtil.sendHttpReq(String.format(GET_TOKEN, APPID, SECRET), GET, null, CHARSET);
			System.out.println(jsonResult);
			token = JSONObject.parseObject(jsonResult, AccessToken.class);
			System.out.println(token.getAccess_token());
			return token;

		}
	}




/*	// 获取openid
	private static final String POST_OPENID = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code";

	public static String getOpenid(String code) throws Exception {
//		return "a";
		String reqUrl=String.format(POST_OPENID,APPID,SECRET,code);
		System.out.println(reqUrl);
		String jsonResult = HttpUtil.sendHttpReq(reqUrl, GET,null, CHARSET);
		System.out.println(jsonResult);
		OpenidResult result=JSONObject.parseObject(jsonResult, OpenidResult.class);
		if(result.getErrcode()==null&&result.getErrmsg()==null){
			return result.getOpenid();
		}
		return null;

	}*/
	
	private static final String GET_AccessTokenAndOpendId = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code";
	public static OpenidResult getAccessTokenAndOpendId(String code) throws Exception {
//		return "a";
		String reqUrl=String.format(GET_AccessTokenAndOpendId,APPID,SECRET,code);
		System.out.println(reqUrl);
		String jsonResult = HttpUtil.sendHttpReq(reqUrl, GET,null, CHARSET);
		System.out.println(jsonResult);
		OpenidResult result=JSONObject.parseObject(jsonResult, OpenidResult.class);
		if(result.getErrcode()==null&&result.getErrmsg()==null){
			OpenidResult openidresult=new OpenidResult();
			openidresult.setAccess_token(result.getAccess_token());
			openidresult.setOpenid(result.getOpenid());
			
			return openidresult;
		}
		return null;

	}
	
	
	/*获取用户信息*/
	/*private static final String GET_USERINFO = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=%s&openid=%s&lang=zh_CN";

	public static UserInfo getUserInfo(String openid) throws IOException {
		AccessToken token = getAccessToken();
		String jsonResult = HttpUtil.sendHttpReq(String.format(GET_USERINFO, token.getAccess_token(), openid), GET,
				null, CHARSET);
		System.out.println(jsonResult);
		UserInfo user = JSONObject.parseObject(jsonResult, UserInfo.class);
		System.out.println(user.getHeadimgurl());
		return user;
	}*/
	/*private static final String GET_USERINFO = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=%s&openid=%s&lang=zh_CN";*/
	
		private static final String GET_USERINFO = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN";
	public static UserInfo getUserInfo(String access_token,String openid) throws IOException {
		AccessToken token = getAccessToken();
		String jsonResult = HttpUtil.sendHttpReq(String.format(GET_USERINFO, access_token, openid), GET,
				null, CHARSET);
		System.out.println(jsonResult);
		UserInfo user = JSONObject.parseObject(jsonResult, UserInfo.class);
		System.out.println(user.getHeadimgurl());
		return user;
	}

}
