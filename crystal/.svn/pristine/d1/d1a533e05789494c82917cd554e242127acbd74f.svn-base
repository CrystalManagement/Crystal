package com.base.common.util;

public class PropertyNameUtil {
	public static String Camel2Underscore(String source) {
		StringBuffer sb = new StringBuffer();
		int length = source.length();
		for (int i = 0; i < length; i++) {
			char c = source.charAt(i);
			if (i == 0) {
				sb.append(Character.toLowerCase(c));
			} else if (Character.isUpperCase(c)) {
				sb.append('_');
				sb.append(Character.toLowerCase(c));
			} else
				sb.append(c);
		}

		return sb.toString();
	}

	public static String Underscore2Camel(String source) {
		StringBuffer sb = new StringBuffer();
		int length = source.length();
		for (int i = 0; i < length; i++) {
			char c = source.charAt(i);
			if (i == 0) {
				sb.append(Character.toLowerCase(c));
			} else if ('_' == c) {
				if (i + 1 >= length)
					break;
				c = source.charAt(i + 1);
				if (c != '_') {
					sb.append(Character.toUpperCase(c));
					i++;
				}
			} else
				sb.append(c);
		}

		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(Camel2Underscore("CamKijjOin"));
		System.out.println(Camel2Underscore("camKijjOin"));
		System.out.println(Underscore2Camel("cam_kijj_kin_"));
	}
}
