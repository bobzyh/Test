package com.st.stmall.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Goods;
import com.st.stmall.service.IGoodsService;
import com.st.stmall.util.Page;
import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
public class GoodsController {
	
	@Autowired
	private IGoodsService iGoodsService;
	
	@RequestMapping("/Manager/goodsmgr.action")
	public String goodsmgr() {
		return "/WEB-INF/Manager/goodsmgr";
	}
	
	@RequestMapping("/Manager/addgoodsview.action")
	public String addgoodsview() {
		return "/WEB-INF/Manager/addgoods";
	}
	
	@RequestMapping("/Manager/addgoods.action")
	public ModelAndView addGoods(Goods goods , MultipartFile pic, HttpServletRequest request) {
		
		// �ļ����浽����?
		String savePath = request.getSession().getServletContext().getRealPath("/upload");
		
		// �����ļ���
		String fileName = pic.getOriginalFilename();
		String subfix = fileName.substring(fileName.lastIndexOf("."));
		String saveFile = new Date().getTime() + subfix;
		
		// �ļ���α���?
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream =  pic.getInputStream();
			
			outputStream = new FileOutputStream(savePath + "/" + saveFile);
			
			IOUtils.copy(inputStream, outputStream);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		// ���ļ���д�뵽goods��
		goods.setGpic(saveFile);
		
		// ����Service��
		int res = iGoodsService.add(goods);
		
		ModelAndView mView = new ModelAndView();
		
		if (res > 0) {
			mView.setViewName("redirect:goodsmgr.action");
		} else {
			mView.addObject("error", "���ʧ��");
			mView.setViewName("/WEB-INF/Manager/addgoods");
		}
		
		return mView;
	}
	
	/**
	 * ��ͻ��˷���JSON��ʽ������
	 */
	@RequestMapping("/getAllGoods.action")
	@ResponseBody	// �������ķ��ض���, ͨ��Jackson��װ��JSON��ʽ���ַ���, ���ظ��ͻ���
	public Page getAllGoods(Goods goods, Page page) {
		
		System.out.println(page.getCurpage());
		
		Page resPage = iGoodsService.selectAllGoods(goods, page);
		
		return resPage;
	}
	@RequestMapping("/search.action")
	public ModelAndView search() {
		
		ModelAndView mView = new ModelAndView();
		
		mView.setViewName("/WEB-INF/goods/search");
		
		return mView;
	}
	
	@RequestMapping("/goods.action")
	public ModelAndView goods(Integer gid) {
		ModelAndView mView = new ModelAndView();
		
		Goods goods = iGoodsService.getGoodsByDd(gid);
		
		mView.addObject("goods", goods);
		
		mView.setViewName("/WEB-INF/goods/goods");
		
		return mView;
	}
	@RequestMapping("/goodsJSON.action")
	@ResponseBody
	public Goods goodsJSON(Integer gid) {
		Goods goods = iGoodsService.getGoodsByDd(gid);
		return goods;
	}
	
}
