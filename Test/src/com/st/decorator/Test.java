package com.st.decorator;

public class Test {

	public static void main(String[] args) {
		
		Car car = new Car();
		
		car.run();
		
		// ��������
		CarDecorator carD = new CarDecorator(car);
		
		carD.run();
	}
}
