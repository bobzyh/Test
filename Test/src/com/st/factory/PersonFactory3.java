package com.st.factory;


/*
 * ��̬����ģʽ
 */
public class PersonFactory3 {

	public static Person getEmp() {
		
		// ׼������  �ӹ�
		
		return new Emp();
	}
	
	public static Person getManager() {

		// ׼������
		
		return new Manager();
	}
}
