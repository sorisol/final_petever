package com.kh.petever.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
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
import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.common.Utils;

import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	int listSize = 0;
	
	@GetMapping("/adminUser.do")
	public ModelAndView adminUser(ModelAndView mav,
						HttpServletRequest request,
			@RequestParam(defaultValue = "1", value="cPage") int cPage) {
		
		final int limit = 10;
		int offset = (cPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);

		List<AdminUser> list = adminService.selectList(rowBounds);

		String url = request.getRequestURI() + "?";
		int totalContents = adminService.totalUser();
		String pageBar = Utils.getPageBarHtml(cPage, 10, totalContents, url);
		
		mav.addObject("list",list);
		mav.addObject("pageBar",pageBar);

		mav.setViewName("admin/admin-user");
		return mav;
	}
	
	@GetMapping("/adminReport.do")
	public ModelAndView adminReport(ModelAndView mav,
									HttpServletRequest request,
			@RequestParam(defaultValue = "1", value="cPage") int cPage) {
		
		final int limit = 10;
		int offset = (cPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<Report> list = adminService.reportList(rowBounds);
		
		String url = request.getRequestURI() + "?";
		int totalContents = adminService.totalReport();
		String pageBar = Utils.getPageBarHtml(cPage, 10, totalContents, url);
		
		mav.addObject("list",list);
		mav.addObject("pageBar",pageBar);
		mav.setViewName("admin/admin-report");
		return mav;
	}
	
	@PostMapping("/reportRemove.do")
	public String reportRemove(@RequestParam("no") String no, 
			RedirectAttributes redirectAttr) {
		
		int result = adminService.reportRemove(no);
		String msg = (result > 0) ? " 게시글이 삭제되었습니다." : "철회실패";
		redirectAttr.addFlashAttribute("msg", msg);
		
		
		return "redirect:/admin/adminReport.do";
	}
	
	@PostMapping("/reportDel.do")
	public String reportDel(@RequestParam("no") String no, 
						RedirectAttributes redirectAttr) {
		
		int result = adminService.reportDel(no);
		String msg = (result > 0) ? " 신고가 철회되었습니다." : "철회실패";
 		redirectAttr.addFlashAttribute("msg", msg);
		
		
		return "redirect:/admin/adminReport.do";
	}
	
	@PostMapping("/reportYN.do")
	public String reportYN(@RequestParam("no") int no,
							@RequestParam("yn") String yn, 
						RedirectAttributes redirectAttr) {
		System.out.println(yn);
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("yn", yn);
		int result = adminService.reportYN(map);
		String msg = (result > 0) ? "게시물이 철회되었습니다." : "철회실패";
 		redirectAttr.addFlashAttribute("msg", msg);
		
		
		return "redirect:/admin/adminReport.do";
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
	
	@GetMapping("/reportSearch.do")
	@ResponseBody
	public Map<String, Object> reportSearch(@RequestParam(value="keyword")String keyword) {
		Map<String, Object> map = new HashMap<>();
		keyword = "%"+keyword+"%";
		
		List<Report> list = adminService.searchReport(keyword);

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
