package com.st.stmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.GoodsMapper;
import com.st.stmall.pojo.Goods;
import com.st.stmall.service.IGoodsService;
import com.st.stmall.util.Page;

@Service
public class GoodsServiceImpl implements IGoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	@Override
	public int add(Goods goods) {
		
		return goodsMapper.add(goods);
	}
	@Override
	public Page selectAllGoods(Goods goods, Page page) {
		
		// 需要知道有几条数据
		Integer count = goodsMapper.getRows(goods);
		
		// 计算有几个页面
		page.setRows(count);
		page.setWhere(goods);
		
		// 查询当前页面应该有哪些数据
		List<Goods> list = goodsMapper.selectAll(page);
		page.setList(list);

		return page;
	}
	@Override
	public Goods getGoodsByDd(Integer gid) {
		// TODO Auto-generated method stub
		return goodsMapper.getGoodsById(gid);
	}

}
