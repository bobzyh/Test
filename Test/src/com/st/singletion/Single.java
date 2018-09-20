package com.st.singletion;

public class Single {
	
	private static Single s = null;

	// 1. ���췽��˽�л�
	private Single() {
	}
	
	// 2. �����ľ�̬�������ظ���Ķ���
	public static Single newInstance() {
		
		// ����ʽ
		if (s == null) {
			s = new Single();
		}
		
		return s;
	}
}
