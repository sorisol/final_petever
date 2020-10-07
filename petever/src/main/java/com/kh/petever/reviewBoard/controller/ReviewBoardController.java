package com.kh.petever.reviewBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petever.reviewBoard.model.service.ReviewBoardService;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/reviewBoard")
@Slf4j
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService reviewBoardService ;
	
	//입양후기게시판연결
	@GetMapping("/reviewBoard.do")
	public String reviewBoardList(Model model, @RequestParam(defaultValue = "1") int cPage) {
		final int limit = 16;
		int offset = (cPage - 1) * limit;
		log.debug("연결");
		System.out.println("연결");
		List<ReviewBoard> list = reviewBoardService.selectReviewBoard(limit, offset);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		return "reviewBoard/reviewBoard";
	}
	
	@GetMapping("/reviewBoardFrm")
	public String reviewBoardFrm() {
		return "reviewBoard/reviewBoardFrm";
	}
	
/*	@RequestMapping("/reviewBoardList.do")
	public ModelAndView reviewBoardList(ModelAndView mav) {
		
		
		mav.setViewName("reviewBoard/reviewBoardList");
		return mav;
		*/

/*	//입양후기게시판연결
		@GetMapping("/reviewBoard.do")
		public String signup() {
			log.debug("연결");
			System.out.println("연결");
			return "reviewBoard/reviewBoard";*/
			

}



/*
 * @Autowired
	private ReviewBoardService reviewBoardService;
	
	//입양후기게시판연결
	@GetMapping("/reviewBoard.do")
	public String reviewBoardList(ModelAndView mav, 
							@RequestParam(defaultValue = "1") int cPage) {
		
	
		
		//1. 사용자 입력값
		final int limit = 10;
		int offset = (cPage - 1) * limit;
			
		
		//2. 업무로직
		List<ReviewBoard> list = reviewBoardService.selectReviewBoard(limit, offset);
		log.debug("list = {}", list);
		
		//3. view단 처리
		mav.addObject("list", list);
		log.debug("연결");
		System.out.println("연결");
		return "reviewBoard/reviewBoard";
		
 * 	
		
 * }
 * 
 * }
 */


		
	