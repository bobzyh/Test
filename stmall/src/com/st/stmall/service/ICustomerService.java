package com.st.stmall.service;

import com.st.stmall.pojo.Customer;

public interface ICustomerService {
	Customer login(Customer customer);

	int register(Customer customer, String password2);

	int update(Customer customer, String password2);
}
