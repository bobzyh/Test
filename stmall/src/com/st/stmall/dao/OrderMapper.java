package com.st.stmall.dao;

import java.util.Date;
import java.util.List;

import com.st.stmall.pojo.Order;

public interface OrderMapper {
	int add(Order order);

	List<Order> selectByCid(Integer cid);

	List<Order> selectByDate(Date time);
}
