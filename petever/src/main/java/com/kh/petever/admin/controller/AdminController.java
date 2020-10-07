package com.kh.petever.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/adminSearch.do")
	@ResponseBody
	public Map<String, Object> adminSearch(@RequestParam(value="keyword")String keyword) {
		Map<String, Object> map = new HashMap<>();
		keyword = "%"+keyword+"%";
		
		List<AdminUser> list = adminService.selectList(keyword);

		map.put("list", list);
		return map;
	}
	
	@PostMapping("/adminDel.do")
	public String adminDel(@RequestParam("id") String id, 
						 RedirectAttributes redirectAttr) {
		System.out.println(id);
		
		int result = adminService.adminDel(id);
		String msg = (result > 0) ? id+" 회원이 삭제되었습니다." : "회원 삭제에 실패하셨습니다.";
 		redirectAttr.addFlashAttribute("msg", msg);
 		
		return "redirect:/admin/adminUser.do";
	}
}
