package com.st.stmall.util;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Encoder;

public class MD5Util {

	// MD5����
	public static String getMD5(String str) {
		
		String newstr = null;
		try {
			//ȷ�����㷽��
			MessageDigest md5=MessageDigest.getInstance("MD5");
			
			//���ܺ���ַ���
			newstr=encryptBASE64(md5.digest(str.getBytes("utf-8")));
		
		} catch (Exception e) {
			// TODO: handle exception
		}

		return newstr; 
	}

	private static String encryptBASE64(byte[] data) {
		// BASE64Encoder encoder = new BASE64Encoder();
		// String encode = encoder.encode(data);
		// ��JKD 9��ʼrt.jar���ѷϳ�����JDK 1.8��ʼʹ��java.util.Base64.Encoder
		Encoder encoder = Base64.getEncoder();
		String encode = encoder.encodeToString(data);
		return encode;
	}
	
	public static void main(String[] args) {
		String string = "123456";
		String str2 = getMD5(string);
		/*
		 * 1. �ı�˳��
		 * 		����
		 * 		��żλ����
		 * 2. �ַ��滻
		 * 		1->A
		 * 		2->3
		 * 		
		 * 26*26*10*10
		 */
		
		
		
		
		System.out.println(str2);
		
	}
}
