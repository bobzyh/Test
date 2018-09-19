package com.st.stmall.service;

import java.util.List;

import com.st.stmall.pojo.Order;

public interface IOrderService {
	int add(Order order);

	List<Order> selectByCid(Integer cid);

	List<Order> selectByDate(Integer type);
}
