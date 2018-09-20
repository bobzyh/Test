package com.st.factory;


/*
 * 静态工厂模式
 */
public class PersonFactory3 {

	public static Person getEmp() {
		
		// 准备工作  加工
		
		return new Emp();
	}
	
	public static Person getManager() {

		// 准备工作
		
		return new Manager();
	}
}
