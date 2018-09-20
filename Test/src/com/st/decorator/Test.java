package com.st.decorator;

public class Test {

	public static void main(String[] args) {
		
		Car car = new Car();
		
		car.run();
		
		// 功能增加
		CarDecorator carD = new CarDecorator(car);
		
		carD.run();
	}
}
