package com.st.singletion;

public class Single2 {
	
	// ��̬����, ��̬��, ��JVM�������ִ��
	// ����ʽ
	private static Single2 s = new Single2();

	// 1. ���췽��˽�л�
	private Single2() {
	}
	
	// 2. �����ľ�̬�������ظ���Ķ���
	public static Single2 newInstance() {
		
		
		return s;
	}
}
