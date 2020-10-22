package com.kh.petever.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.kh.petever.animalTag.model.service.AnimalTagService;
import com.kh.petever.animalTag.model.vo.AnimalTag;
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
	public ModelAndView adminUser(ModelAndView mav) {
		
		List<AdminUser> list = adminService.selectList();

		mav.addObject("list",list);
		mav.setViewName("admin/admin-user");
		return mav;
	}
	
	@GetMapping("/admin.do")
	public ModelAndView adminReport(ModelAndView mav) {
		
		Calendar cal = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		cal.add(cal.DATE, -3); // 7일(일주일)을 뺀다
		String day = format.format(cal.getTime());

		List<Report> animalList = adminService.reportList(day);
		List<Report> reviewList = adminService.reportReviewList(day);
		int animalCnt = adminService.animalDayCnt(day);
		int reviewCnt = adminService.reviewDayCnt(day);
		mav.addObject("animalList",animalList);
		mav.addObject("reviewList",reviewList);
		mav.addObject("animalCnt",animalCnt);
		mav.addObject("reviewCnt",reviewCnt);
		
		
		List<AnimalTag> list = adminService.selectTagList();
		mav.addObject("list",list);
		
		mav.setViewName("admin/admin");
		return mav;
	}

	@GetMapping("/adminAnimalReport.do")
	public ModelAndView adminAnimalReport(ModelAndView mav) {
		
		List<Report> list = adminService.reportList();
		
		mav.addObject("list",list);
		mav.setViewName("admin/admin-animal-report");
		return mav;
	}
	
	@GetMapping("/adminReviewReport.do")
	public ModelAndView adminReviewReport(ModelAndView mav) {
		
		List<Report> list = adminService.reportReviewList();
		mav.addObject("list",list);
		mav.setViewName("admin/admin-review-report");
		return mav;
	}
	
	@PostMapping("/reportRemove.do")
	public String reportRemove(@RequestParam("no") String no, 
			@RequestParam("col") String col,
			RedirectAttributes redirectAttr) {
		
		int result;
		String msg = "";
		
		if(col.equals("animal")) {
			result = adminService.reportRemove(no);
			msg = (result > 0) ? " 게시글이 삭제되었습니다." : "삭제실패";
		}else if(col.equals("review")) {
			result = adminService.reportReviewDel(no);
			msg = (result > 0) ? " 게시글이 삭제되었습니다." : "삭제실패";
		}
		
		redirectAttr.addFlashAttribute("msg", msg);
		
		if(col.equals("animal")) {
			return "redirect:/admin/adminAnimalReport.do";
		}else if(col.equals("review")) {
			return "redirect:/admin/adminReviewReport.do";
		}
		return "redirect:/admin/admin.do";
	}
	
	@PostMapping("/reportDel.do")
	public String reportDel(@RequestParam("no") String no,
							@RequestParam("col") String col,
						RedirectAttributes redirectAttr) {
		int	result = adminService.reportDel(no);
		String msg = (result > 0) ? " 신고가 철회되었습니다." : "철회실패";
 		redirectAttr.addFlashAttribute("msg", msg);
		
 		if(col.equals("animal")) {
			result = adminService.reportDel(no);
			return "redirect:/admin/adminAnimalReport.do";
		}else if(col.equals("review")) {
			result = adminService.reportReviewDel(no);
			return "redirect:/admin/adminReviewReport.do";
		}
 		return "redirect:/admin/admin.do";
	}
	
	@PostMapping("/reportYN.do")
	public String reportYN(@RequestParam("no") int no,
							@RequestParam("yn") String yn, 
							@RequestParam("col") String col, 
						RedirectAttributes redirectAttr) {
		System.out.println(col);
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("yn", yn);
		int result = adminService.reportYN(map);
		String msg = (result > 0) ? "게시물이 철회되었습니다." : "철회실패";
 		redirectAttr.addFlashAttribute("msg", msg);
		
 		if(col.equals("animal")) {
			return "redirect:/admin/adminAnimalReport.do";
		}else if(col.equals("review")) {
			return "redirect:/admin/adminReviewReport.do";
		}
		return "redirect:/";
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
	
	@GetMapping("/reportReviewSearch.do")
	@ResponseBody
	public Map<String, Object> reportReviewSearch(@RequestParam(value="keyword")String keyword) {
		Map<String, Object> map = new HashMap<>();
		keyword = "%"+keyword+"%";
		
		List<Report> list = adminService.searchReviewReport(keyword);
		
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
	
	@GetMapping("/reportYn.do")
	@ResponseBody
	public Map<String, Object> reportYn(@RequestParam(value="yn")String yn) {
		Map<String, Object> map = new HashMap<>();
		
		List<Report> list = adminService.reportYn(yn);
		
		map.put("list", list);
		
		return map;
	}

	@GetMapping("/animalYn.do")
	@ResponseBody
	public Map<String, Object> animalYn(@RequestParam(value="yn")String yn) {
		Map<String, Object> map = new HashMap<>();
		
		List<Report> list = adminService.animalYn(yn);
		
		map.put("list", list);
		
		return map;
	}

	@GetMapping("/searchRole.do")
	@ResponseBody
	public Map<String, Object> searchRole(@RequestParam(value="role")String role) {
		Map<String, Object> map = new HashMap<>();
		
		List<Report> list = adminService.searchRole(role);
		
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping("/adminRole.do")
	public String adminRole(@RequestParam("id") String id,
							@RequestParam("role") String role,
							RedirectAttributes redirectAttr) {
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("role", role);
		
		int result = adminService.adminRole(map);
		String msg = "";
		if(role.equals("R")) {
			msg = (result > 0) ? id+" 회원이 사면되었습니다." : "회원 사면에 실패하셨습니다.";
		}else {
			msg = (result > 0) ? id+" 회원이 정지되었습니다." : "회원 정지에 실패하셨습니다.";
		}
		
 		redirectAttr.addFlashAttribute("msg", msg);
 		
		return "redirect:/admin/adminUser.do";
	}
}
