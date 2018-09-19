package com.st.stmall.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.stmall.service.ITypeService;

@Controller
public class TypeController {

	@Autowired
	private ITypeService iTypeService;
	
	@RequestMapping("/getFType.action")
	@ResponseBody
	public List<HashMap<String, Object>>  getFType(){
		
		// 调用Service层
		return iTypeService.getFType();
	}
	@RequestMapping("/getSType.action")
	@ResponseBody
	public List<HashMap<String, Object>>  getSType(Integer ptid){
		
		System.out.println(ptid);
		
		// 调用Service层
		return iTypeService.getSType(ptid);
	}
	
}
