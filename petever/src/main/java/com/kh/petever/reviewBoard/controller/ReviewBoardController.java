package com.kh.petever.reviewBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/reviewBoard")
@Slf4j
public class ReviewBoardController {
	
	//입양후기게시판연결
	@GetMapping("/reviewBoard.do")
	public String signup() {
		log.debug("연결");
		System.out.println("연결");
		return "reviewBoard/reviewBoard";
		
	}
}

/*
 * @Controller
 * 
 * @RequestMapping("/reviewBoard")
 * 
 * @Slf4j public class ReviewBoardController{
 * 
 * @Autowired private ReviewBoardService reviewBoardService;
 * 
 * @RequestMapping("/reviewBoard.do") public ModelAndView
 * reviewBoard(ModelAndView mav) {
 * 
 * mav.setViewName("reviewBoard/reviewBoard"); return mav;
 * 
 * }
 * 
 * }
 */


		
	