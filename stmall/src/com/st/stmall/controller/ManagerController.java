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
		
		// ��Service��
		Manager resMgr = iManagerService.login(mgr);
		
		if (resMgr != null) {
			// ��¼�ɹ�
			// ��ת��������ҳ
			mView.setViewName("redirect:index.action");
		} else {
			// ��¼ʧ��
			mView.addObject("error", "��¼ʧ��");
			mView.setViewName("mgrlogin");
		}
		
		return mView;
	}
	@RequestMapping("/index.action")
	public String index() {
		return "/WEB-INF/Manager/index";
	}
}
