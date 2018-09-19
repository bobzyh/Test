package com.st.stmall.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.TypeMapper;
import com.st.stmall.service.ITypeService;

@Service
public class TypeServiceImpl implements ITypeService {

	@Autowired
	private TypeMapper typeMapper;
	
	@Override
	public List<HashMap<String, Object>> getFType() {
		return typeMapper.getFType();
	}

	@Override
	public List<HashMap<String, Object>> getSType(Integer ptid) {
		return typeMapper.getSType(ptid);
	}
}
