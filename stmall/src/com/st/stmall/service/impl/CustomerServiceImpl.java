package com.st.stmall.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.CustomerMapper;
import com.st.stmall.pojo.Customer;
import com.st.stmall.service.ICustomerService;
import com.st.stmall.util.MD5Util;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public Customer login(Customer customer) {
		// 1. 取用户数据
		Customer cusTemp = customerMapper.selectByName(customer.getCname());

		Date now = new Date();
		Date errTime = cusTemp.getErrtime();
		
		System.out.println(now.getTime() - errTime.getTime());
		
		// 2. 错误次数大于5时, 判断时间
		if (cusTemp.getErrcount() == 5) {
			if (now.getTime() - errTime.getTime() < 5*60*1000) {
				throw new RuntimeException("密码错误次数过多, 请稍后再试!");
			}
		}
		
		// 在访问数据库之前, 进行MD5加密
		String vpwd = MD5Util.getMD5(customer.getPassword());
		customer.setPassword(vpwd);
		
		Customer resCustomer = customerMapper.login(customer);
		
		// 密码错误
		if (resCustomer == null) {
			// 记录错误次数
			if (cusTemp.getErrcount() == 0 ||
					now.getTime() - errTime.getTime() > 5*60*1000) {
				// 错误次数置1
				cusTemp.setErrcount(1);
				// 错误时间初始化
				cusTemp.setErrtime(new Date());
				
				customerMapper.update(cusTemp);
			} else {
				// 
				cusTemp.setErrcount(cusTemp.getErrcount()+1);
				
				customerMapper.update(cusTemp);
			}
		} else {
			cusTemp.setErrcount(0);
			cusTemp.setErrtime(null);
			customerMapper.update(cusTemp);
		}
		
		return resCustomer;
	}

	@Override
	public int register(Customer customer, String password2) {

		// 1. 用户名是否重复
		Customer cusTemp = customerMapper.selectByName(customer.getCname());
		if (cusTemp != null) {
			return -100;
		}
		
		// 2. 两次密码是否一致
		if (!password2.equals(customer.getPassword())) {
			return -200;
		}
		
		// 3. 加密
		customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		
		// 4. 写入数据库
		
		return customerMapper.insert(customer);
	}

	@Override
	public int update(Customer customer, String password2) {
		
		// 1. 对比密码
		if (!password2.equals(customer.getPassword())) {
			return -100;
		}
		
		// 当密码不为空时, 加密
		if (!"".equals(password2)) {
			customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		}
		
		// 2. 调用Dao层
		return customerMapper.update(customer);
	}

}
