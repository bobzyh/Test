package com.st.factory;


/*
 * 工厂方法模式
 */
public class PersonFactory2 {

	public Person getEmp() {
		
		// 准备工作
		
		return new Emp();
	}
	
	public Person getManager() {

		// 准备工作
		
		return new Manager();
	}
}
