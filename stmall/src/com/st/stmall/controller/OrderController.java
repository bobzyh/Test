package com.st.stmall.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.st.stmall.pojo.Customer;
import com.st.stmall.pojo.Details;
import com.st.stmall.pojo.Order;
import com.st.stmall.service.IOrderService;
import com.st.stmall.service.impl.OrderServiceImpl;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class OrderController {
	
	@Autowired
	IOrderService iOrderService;
	
	@RequestMapping("/Customer/subOrder.action")
	public ModelAndView subOrder(Order order, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		// 结算
		// 取cid
		Customer customer = (Customer) session.getAttribute("customer");
		order.setCid(customer.getCid());
		order.setOaddr(customer.getCaddr());
		order.setOname(customer.getCrealname());
		order.setOphone(customer.getCphone());

		ModelAndView mView = new ModelAndView();
		
		try {
			iOrderService.add(order);
			
			mView.setViewName("redirect:myOrder.action");
			
			// 订单成功后, 需要删除Cookie中的数据
			Cookie[] cookies = request.getCookies();
			
			for (Cookie cookie : cookies) {
				if ("cart".equals(cookie.getName())) {
					
					ObjectMapper objMapper = new ObjectMapper();
					String cValue = "";
					
					try {
						cValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
					} catch (UnsupportedEncodingException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					
					try {
						List<HashMap> list = objMapper.readValue(cValue, ArrayList.class);
						
						Iterator<HashMap> it = list.iterator();
						while (it.hasNext()) {

							HashMap map = it.next();
							
							for(Details details : order.getList()) {
								
								if (map.get("gid").equals(details.getGid())) {
									it.remove();
								}
							}
						}
						
						String newValue = objMapper.writeValueAsString(list);
						System.out.println(newValue);
						
						newValue = URLEncoder.encode(newValue, "UTF-8");
						cookie.setValue(newValue);
						
					} catch (JsonParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JsonMappingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					cookie.setPath(request.getContextPath());
					cookie.setMaxAge(7*24*60*60*1000);
					response.addCookie(cookie);
					
				}
			}
			
			
		} catch (RuntimeException e) {
			e.printStackTrace();
			// 向客户端返回错误信息
			mView.addObject("error", e.getMessage());
			
			mView.setViewName("error");
		}
		
		
		
		return mView;
	}
	
	@RequestMapping("/Customer/myOrder.action")
	public ModelAndView myOrder(HttpSession session) {
		
		ModelAndView mView  = new ModelAndView();
		
		Customer customer = (Customer) session.getAttribute("customer");
		
		List<Order> list = iOrderService.selectByCid(customer.getCid());
		
		mView.addObject("list", list);
		
		mView.setViewName("WEB-INF/Customer/order");
		
		return mView;
	}
	@RequestMapping("/Manager/order.action")
	public String order(HttpSession session, Integer type) {	
		return "WEB-INF/Manager/order";
	}
	@RequestMapping("/Manager/orderJSON.action")
	@ResponseBody
	public List<Order> orderJSON(Integer type){
		List<Order> list = iOrderService.selectByDate(type);		
		return list;
	}
}
