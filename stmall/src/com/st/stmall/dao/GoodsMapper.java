package com.st.stmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.st.stmall.pojo.Goods;
import com.st.stmall.util.Page;

public interface GoodsMapper {
	int add(Goods goods);

	Integer getRows(Goods goods);

	List<Goods> selectAll(Page page);

	Goods getGoodsById(Integer gid);
	
	int updateCount(Integer gid, Integer count);
}
