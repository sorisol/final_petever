package com.kh.petever.reviewBoard.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//글쓰기 연결
	@GetMapping("/reviewBoardFrm")
	public String reviewBoardFrm() {
		return "reviewBoard/reviewBoardFrm";
	
	}
	
	//글쓰기
	@PostMapping("/reviewBoardEnroll.do")
	public String reviewBoardEnroll(ReviewBoard review,
			  @RequestParam(value="upFile",required=false) MultipartFile[] upFiles,
			  HttpServletRequest request,
			  RedirectAttributes redirectAttr) {

		/*
		 * //1. 파일을 서버컴퓨터에 저장 List<Attachment> attachList = new ArrayList<>(); String
		 * saveDirectory = request.getServletContext()
		 * .getRealPath("/resources/upload/board");
		 * 
		 * for(MultipartFile f : upFiles) {
		 * 
		 * if(!f.isEmpty() && f.getSize() != 0) { //1. 파일명 생성 String renamedFileName =
		 * Utils.getRenamedFileName(f.getOriginalFilename());
		 * 
		 * //2. 메모리의 파일 -> 서버경로상의 파일 File newFile = new File(saveDirectory,
		 * renamedFileName); try { f.transferTo(newFile); } catch (IllegalStateException
		 * | IOException e) { e.printStackTrace(); } //3. attachment객체 생성 Attachment
		 * attach = new Attachment();
		 * attach.setOriginalFileName(f.getOriginalFilename());
		 * attach.setRenamedFileName(renamedFileName); attachList.add(attach); }
		 * 
		 * }
		 * 
		 * reviewBoard.setAttachList(attachList); log.debug("reviewBoard = {}", review);
		 */
		
		//2. 게시글, 첨부파일정보를 DB에 저장
		try {
			int result = reviewBoardService.insertReviewBoard(review);
			redirectAttr.addFlashAttribute("msg", "게시글 등록 성공!");
		} catch (Exception e) {
			log.error("게시물 등록  오류", e);
//			redirectAttr.addFlashAttribute("msg", "게시글 등록 실패!");
			
			//예외발생을 spring container에게 전달 : 지정한  예외페이지로 응답처리
			throw e;
		}
		
		return "redirect:/reviewBoard/reviewBoard.do";
	}
}