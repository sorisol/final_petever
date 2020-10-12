package com.kh.petever.check.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/check")
public class CheckController {

	@GetMapping("/check.do")
	public String check() {
		
		return "check/check"; 
	}
	
	@GetMapping("/checkTotal.do")
	public ModelAndView checkTotal(@RequestParam(value="total", required=false) String total,
									ModelAndView mav) {
		System.out.println(total);
		mav.addObject("total",total);
		mav.setViewName("check/checkTotal");
		return mav; 
	}
}
