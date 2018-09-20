package com.st.factory;

/*
 * ¼òµ¥¹¤³§
 */
public class PersonFactoy {

	public Person getPerson(String str) {
		
		if ("emp".equals(str)) {
			return new Emp();
		} else if ("mgr".equals(str)) {
			return new Manager();
		} else {
			return null;
		}
	}
}
