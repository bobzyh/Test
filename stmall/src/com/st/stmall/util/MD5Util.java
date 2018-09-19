package com.st.stmall.util;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Encoder;

public class MD5Util {

	// MD5加密
	public static String getMD5(String str) {
		
		String newstr = null;
		try {
			//确定计算方法
			MessageDigest md5=MessageDigest.getInstance("MD5");
			
			//加密后的字符串
			newstr=encryptBASE64(md5.digest(str.getBytes("utf-8")));
		
		} catch (Exception e) {
			// TODO: handle exception
		}

		return newstr; 
	}

	private static String encryptBASE64(byte[] data) {
		// BASE64Encoder encoder = new BASE64Encoder();
		// String encode = encoder.encode(data);
		// 从JKD 9开始rt.jar包已废除，从JDK 1.8开始使用java.util.Base64.Encoder
		Encoder encoder = Base64.getEncoder();
		String encode = encoder.encodeToString(data);
		return encode;
	}
	
	public static void main(String[] args) {
		String string = "123456";
		String str2 = getMD5(string);
		/*
		 * 1. 改变顺序
		 * 		倒序
		 * 		奇偶位调换
		 * 2. 字符替换
		 * 		1->A
		 * 		2->3
		 * 		
		 * 26*26*10*10
		 */
		
		
		
		
		System.out.println(str2);
		
	}
}
