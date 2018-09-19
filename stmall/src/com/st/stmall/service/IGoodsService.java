package com.st.stmall.service;

import com.st.stmall.pojo.Goods;
import com.st.stmall.util.Page;

public interface IGoodsService {
	int add(Goods goods);

	Page selectAllGoods(Goods goods, Page page);

	Goods getGoodsByDd(Integer gid);
}
