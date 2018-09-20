package com.st.singletion;

public class Single2 {
	
	// 静态属性, 静态块, 在JVM加载类的执行
	// 饿汉式
	private static Single2 s = new Single2();

	// 1. 构造方法私有化
	private Single2() {
	}
	
	// 2. 公共的静态方法返回该类的对象
	public static Single2 newInstance() {
		
		
		return s;
	}
}
