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
		// 1. ȡ�û�����
		Customer cusTemp = customerMapper.selectByName(customer.getCname());

		Date now = new Date();
		Date errTime = cusTemp.getErrtime();
		
		System.out.println(now.getTime() - errTime.getTime());
		
		// 2. �����������5ʱ, �ж�ʱ��
		if (cusTemp.getErrcount() == 5) {
			if (now.getTime() - errTime.getTime() < 5*60*1000) {
				throw new RuntimeException("��������������, ���Ժ�����!");
			}
		}
		
		// �ڷ������ݿ�֮ǰ, ����MD5����
		String vpwd = MD5Util.getMD5(customer.getPassword());
		customer.setPassword(vpwd);
		
		Customer resCustomer = customerMapper.login(customer);
		
		// �������
		if (resCustomer == null) {
			// ��¼�������
			if (cusTemp.getErrcount() == 0 ||
					now.getTime() - errTime.getTime() > 5*60*1000) {
				// ���������1
				cusTemp.setErrcount(1);
				// ����ʱ���ʼ��
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

		// 1. �û����Ƿ��ظ�
		Customer cusTemp = customerMapper.selectByName(customer.getCname());
		if (cusTemp != null) {
			return -100;
		}
		
		// 2. ���������Ƿ�һ��
		if (!password2.equals(customer.getPassword())) {
			return -200;
		}
		
		// 3. ����
		customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		
		// 4. д�����ݿ�
		
		return customerMapper.insert(customer);
	}

	@Override
	public int update(Customer customer, String password2) {
		
		// 1. �Ա�����
		if (!password2.equals(customer.getPassword())) {
			return -100;
		}
		
		// �����벻Ϊ��ʱ, ����
		if (!"".equals(password2)) {
			customer.setPassword(MD5Util.getMD5(customer.getPassword()));
		}
		
		// 2. ����Dao��
		return customerMapper.update(customer);
	}

}
