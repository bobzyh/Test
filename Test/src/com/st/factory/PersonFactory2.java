package com.st.factory;


/*
 * ��������ģʽ
 */
public class PersonFactory2 {

	public Person getEmp() {
		
		// ׼������
		
		return new Emp();
	}
	
	public Person getManager() {

		// ׼������
		
		return new Manager();
	}
}
