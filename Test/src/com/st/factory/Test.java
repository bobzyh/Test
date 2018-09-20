package com.st.factory;

public class Test {
	public static void main(String[] args) {
		
		// 创建对象
		// 需要知识Manger类和EMP类的构造方法
		
		Manager m = new Manager();
		Emp e = new Emp();
		
		// 使用工厂创建一个员工对象
		PersonFactoy pFactoy = new PersonFactoy();
		Person p1 = pFactoy.getPerson("emp");
		
		// 使用工厂方法模式
		PersonFactory2 pFactory2 = new PersonFactory2();
		Person p2 = pFactory2.getManager();
		
		// 使用静态工厂
		Person p3 = PersonFactory3.getEmp();
	}
}
