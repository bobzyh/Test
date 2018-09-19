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
	 * 1. 登录
	 * 2. 退出
	 * 3. 注册
	 * 4. 修改信息
	 * 
	 */
	@RequestMapping("/login.action")
	public ModelAndView login(Customer customer, String code, HttpSession session) {
		
		
		
		ModelAndView mView = new ModelAndView();
		
		String scode = (String) session.getAttribute("code");
		
		// 全部转成小写再对比
		scode = scode.toLowerCase();
		code = code.toLowerCase();
		
		// 验证码错误时, 不登录
		if (!scode.equals(code)) {
			// 登录失败
			mView.addObject("error", "验证码错误!");
			mView.setViewName("login");
		} else {
			// 验证码正确
			try {
				customer = iCustomerService.login(customer);
				
				if (customer != null) {
					// 登录成功 重定向
					session.setAttribute("customer", customer);
					mView.setViewName("redirect:../index.jsp");
				} else {	
					// 登录失败
					mView.addObject("error", "账号或密码错误!");
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
			// 从response上获取一个输出流
			ServletOutputStream out = response.getOutputStream();
			// 将图片写入到输入流中
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
			// 注册成功, 跳转到登录页面
			mView.setViewName("redirect:../login.jsp");
		} else if (res == -100) {
			mView.addObject("error", "账号已存在!");
			mView.setViewName("register");
		}else if (res == -200) {
			mView.addObject("error", "两次密码不一致!");
			mView.setViewName("register");
		}
		
		return mView;
	}
	
	@RequestMapping("/logout.action")
	public String logout(HttpSession session) {
		
		// 清除Session中的数据
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
		
		// 获取当前登录用户
		Customer customer2 = (Customer) session.getAttribute("customer");
		customer.setCid(customer2.getCid());
		
		int res = iCustomerService.update(customer, password2);
		
		if (res>0) {
			// 修改成功
			session.removeAttribute("customer");
			mView.setViewName("redirect:../login.jsp");
			
		} else if (res == -100) {
			// 两次密码不一致
			mView.addObject("error", "两次密码不一致");
			mView.setViewName("WEB-INF/Customer/center");
		} else {
			// 修改失败
			mView.addObject("error", "修改失败");
			mView.setViewName("WEB-INF/Customer/center");
		}
		
		return mView;
	}
}
