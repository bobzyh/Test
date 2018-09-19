package com.st.stmall.dao;

import java.util.HashMap;
import java.util.List;

public interface TypeMapper {
	List<HashMap<String, Object>> getFType();

	List<HashMap<String, Object>> getSType(Integer ptid);
}
