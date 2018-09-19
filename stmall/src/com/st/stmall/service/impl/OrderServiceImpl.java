package com.st.stmall.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.CustomerMapper;
import com.st.stmall.dao.DetailsMapper;
import com.st.stmall.dao.GoodsMapper;
import com.st.stmall.dao.OrderMapper;
import com.st.stmall.pojo.Details;
import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Order;
import com.st.stmall.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	CustomerMapper customerMapper;
	
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired 
	DetailsMapper detailsMapper;
	
	@Override
	public int add(Order order) {
		
		Double oprice = 0.0;
		
		try {
			// �����Ʒ, �޸Ŀ��
			for(Details details : order.getList()) {
				
				// �޸�details�Ŀ��
				goodsMapper.updateCount(details.getGid(), details.getGcount());
				
				// ȡ����Ʒ����ϸ��Ϣ
				Goods goods = goodsMapper.getGoodsById(details.getGid());
				
				details.setGprice(goods.getGprice());
				
				oprice += details.getGcount() * goods.getGprice();
			}
		} catch (Exception e) {
			// ��治��
			e.printStackTrace();
			throw new RuntimeException("����ʧ��, ��治��!");
		}
		
		try {
			// ��Ǯ
			int res = customerMapper.updateMoney(order.getCid(), oprice);
		} catch (Exception e) {
			 e.printStackTrace();
			 throw new RuntimeException("����ʧ��, ����!�뼰ʱ��ֵ!");
		}
		
		// д��Order��
		order.setOprice(oprice);
		orderMapper.add(order);
		
		// д��details��
		// �����Ʒ, �޸Ŀ��
		for(Details details : order.getList()) {
			details.setOnum(order.getOnum());
			
			// д�����ݿ�
			detailsMapper.add(details);
		}
		
		return 1;
	}

	@Override
	public List<Order> selectByCid(Integer cid) {
		return orderMapper.selectByCid(cid);
	}

	@Override
	public List<Order> selectByDate(Integer type) {
		Calendar lastDate = Calendar.getInstance();

		lastDate.set(Calendar.HOUR_OF_DAY, 0);
		lastDate.set(Calendar.MINUTE, 0);
		lastDate.set(Calendar.SECOND, 0);
		if (type == null) {
			
		} else if (type == 2) {
	        lastDate.roll(Calendar.DATE, -6);//���ڻع�7��
		} else if (type == 3) {
	        lastDate.roll(Calendar.MONTH, -1);//���ڻع�7��
		}
		
		return orderMapper.selectByDate(lastDate.getTime());
	}

}
