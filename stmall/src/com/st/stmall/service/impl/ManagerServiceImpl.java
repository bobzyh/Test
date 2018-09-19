package com.st.stmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.ManagerMapper;
import com.st.stmall.pojo.Manager;
import com.st.stmall.service.IManagerService;

@Service
public class ManagerServiceImpl implements IManagerService {
	
	@Autowired
	private ManagerMapper managerMapper;
	
	@Override
	public Manager login(Manager mgr) {
		return managerMapper.login(mgr);
	}

}
