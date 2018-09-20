package com.st.singletion;

public class Single {
	
	private static Single s = null;

	// 1. 构造方法私有化
	private Single() {
	}
	
	// 2. 公共的静态方法返回该类的对象
	public static Single newInstance() {
		
		// 懒汉式
		if (s == null) {
			s = new Single();
		}
		
		return s;
	}
}
