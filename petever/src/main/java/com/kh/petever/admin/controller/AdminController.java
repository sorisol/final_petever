package com.kh.petever.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petever.admin.model.service.AdminService;
import com.kh.petever.admin.model.vo.AdminUser;

import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/adminUser.do")
	public ModelAndView adminUser(ModelAndView mav) {
		
		List<AdminUser> list = adminService.selectList();
		
		mav.addObject("list",list);
		System.out.println(list);
		mav.setViewName("admin/admin-user");
		return mav;
	}
}
