package com.st.stmall.controller;

import java.io.ByteArrayOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Customer;
import com.st.stmall.service.ICustomerService;
import com.st.stmall.util.VerifyCode;

@Controller
@RequestMapping("/Customer")
public class CustomerController {

	@Autowired
	private ICustomerService iCustomerService;
	
	/*
	 * 1. ��¼
	 * 2. �˳�
	 * 3. ע��
	 * 4. �޸���Ϣ
	 * 
	 */
	@RequestMapping("/login.action")
	public ModelAndView login(Customer customer, String code, HttpSession session) {
		
		
		
		ModelAndView mView = new ModelAndView();
		
		String scode = (String) session.getAttribute("code");
		
		// ȫ��ת��Сд�ٶԱ�
		scode = scode.toLowerCase();
		code = code.toLowerCase();
		
		// ��֤�����ʱ, ����¼
		if (!scode.equals(code)) {
			// ��¼ʧ��
			mView.addObject("error", "��֤�����!");
			mView.setViewName("login");
		} else {
			// ��֤����ȷ
			try {
				customer = iCustomerService.login(customer);
				
				if (customer != null) {
					// ��¼�ɹ� �ض���
					session.setAttribute("customer", customer);
					mView.setViewName("redirect:../index.jsp");
				} else {	
					// ��¼ʧ��
					mView.addObject("error", "�˺Ż��������!");
					mView.setViewName("login");
				}
			} catch (Exception e) {
				e.printStackTrace();
				mView.addObject("error", e.getMessage());
				mView.setViewName("login");
			}
		}
		
		return mView;
		
	}
	@RequestMapping("/getCode.action")
	public void getCode(HttpServletResponse response, HttpSession session) {
		
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		
		String code = VerifyCode.getCodeImg(output);
		
		session.setAttribute("code", code);
		
		try {
			// ��response�ϻ�ȡһ�������
			ServletOutputStream out = response.getOutputStream();
			// ��ͼƬд�뵽��������
			output.writeTo(out);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@RequestMapping("/register.action")
	public ModelAndView register(Customer customer, String password2) {
		
		ModelAndView mView = new ModelAndView();
		
		int res = iCustomerService.register(customer, password2);
		
		if (res > 0) {
			// ע��ɹ�, ��ת����¼ҳ��
			mView.setViewName("redirect:../login.jsp");
		} else if (res == -100) {
			mView.addObject("error", "�˺��Ѵ���!");
			mView.setViewName("register");
		}else if (res == -200) {
			mView.addObject("error", "�������벻һ��!");
			mView.setViewName("register");
		}
		
		return mView;
	}
	
	@RequestMapping("/logout.action")
	public String logout(HttpSession session) {
		
		// ���Session�е�����
		session.removeAttribute("customer");
		
		return "redirect:../index.jsp";
	}
	@RequestMapping("/center.action")
	public String center() {
		return "WEB-INF/Customer/center";
	}
	
	@RequestMapping("/update.action")
	public ModelAndView update(Customer customer, String password2, HttpSession session, HttpServletRequest request) {
		
		ModelAndView mView = new ModelAndView();
		
		// ��ȡ��ǰ��¼�û�
		Customer customer2 = (Customer) session.getAttribute("customer");
		customer.setCid(customer2.getCid());
		
		int res = iCustomerService.update(customer, password2);
		
		if (res>0) {
			// �޸ĳɹ�
			session.removeAttribute("customer");
			mView.setViewName("redirect:../login.jsp");
			
		} else if (res == -100) {
			// �������벻һ��
			mView.addObject("error", "�������벻һ��");
			mView.setViewName("WEB-INF/Customer/center");
		} else {
			// �޸�ʧ��
			mView.addObject("error", "�޸�ʧ��");
			mView.setViewName("WEB-INF/Customer/center");
		}
		
		return mView;
	}
}
