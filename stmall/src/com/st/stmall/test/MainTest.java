package com.st.stmall.test;

import java.util.Calendar;

public class MainTest {
	public static void main(String[] args) {
		Calendar lastDate = Calendar.getInstance();
		lastDate.set(Calendar.HOUR, 0);
		lastDate.set(Calendar.MINUTE, 0);
		lastDate.set(Calendar.SECOND, 0);
		lastDate.roll(Calendar.DATE, -7);//日期回滚7天
		System.out.println(lastDate.getTime());
	}
}
