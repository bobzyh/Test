package com.st.stmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Manager;
import com.st.stmall.service.IManagerService;

@Controller
@RequestMapping("/Manager")
public class ManagerController {
	
	@Autowired
	private IManagerService iManagerService;
	
	@RequestMapping("/login.action")
	public ModelAndView login(Manager mgr, HttpSession session) {
		
		ModelAndView mView = new ModelAndView();
		
		// 调Service层
		Manager resMgr = iManagerService.login(mgr);
		
		if (resMgr != null) {
			// 登录成功
			// 跳转到管理主页
			mView.setViewName("redirect:index.action");
		} else {
			// 登录失败
			mView.addObject("error", "登录失败");
			mView.setViewName("mgrlogin");
		}
		
		return mView;
	}
	@RequestMapping("/index.action")
	public String index() {
		return "/WEB-INF/Manager/index";
	}
}
