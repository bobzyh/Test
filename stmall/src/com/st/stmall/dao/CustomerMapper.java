package com.st.stmall.dao;

import com.st.stmall.pojo.Customer;

public interface CustomerMapper {
	Customer login(Customer customer);

	Customer selectByName(String cname);

	int insert(Customer customer);

	int update(Customer customer);
	
	int updateMoney(Integer cid, Double money);
}
