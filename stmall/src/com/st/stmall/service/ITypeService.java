package com.st.stmall.service;

import java.util.HashMap;
import java.util.List;

public interface ITypeService {
	List<HashMap<String, Object>> getFType();

	List<HashMap<String, Object>> getSType(Integer ptid);
}
