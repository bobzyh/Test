package com.st.factory;

public class Test {
	public static void main(String[] args) {
		
		// ��������
		// ��Ҫ֪ʶManger���EMP��Ĺ��췽��
		
		Manager m = new Manager();
		Emp e = new Emp();
		
		// ʹ�ù�������һ��Ա������
		PersonFactoy pFactoy = new PersonFactoy();
		Person p1 = pFactoy.getPerson("emp");
		
		// ʹ�ù�������ģʽ
		PersonFactory2 pFactory2 = new PersonFactory2();
		Person p2 = pFactory2.getManager();
		
		// ʹ�þ�̬����
		Person p3 = PersonFactory3.getEmp();
	}
}
