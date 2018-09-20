package com.st.decorator;

public class CarDecorator implements Mobile{

	Car car = null;
	
	public CarDecorator(Car car) {
		this.car = car;
	}
	
	@Override
	public void run() {
		
		System.out.println(" 老司机开车,兄弟们快上车!");
		
		car.run();
	}

}
