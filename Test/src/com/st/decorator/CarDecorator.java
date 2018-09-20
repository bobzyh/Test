package com.st.decorator;

public class CarDecorator implements Mobile{

	Car car = null;
	
	public CarDecorator(Car car) {
		this.car = car;
	}
	
	@Override
	public void run() {
		
		System.out.println(" ��˾������,�ֵ��ǿ��ϳ�!");
		
		car.run();
	}

}
