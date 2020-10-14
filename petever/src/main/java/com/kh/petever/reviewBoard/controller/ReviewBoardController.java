package com.kh.petever.reviewBoard.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.common.Utils;
import com.kh.petever.reviewBoard.model.service.ReviewBoardService;
import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/reviewBoard")
@Slf4j
public class ReviewBoardController {

	@Autowired
	private ReviewBoardService reviewBoardService;

	// 입양후기 게시판 연결
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

	// 글쓰기폼 연결
	@GetMapping("/reviewBoardFrm")
	public String reviewBoardFrm() {
		return "reviewBoard/reviewBoardFrm";

	}

	// 글쓰기
	@RequestMapping(value = "/insertReviewBoard.do", method = RequestMethod.POST)
	public String insertReviewBoard(ReviewBoard reviewBoard, HttpServletRequest request,
			RedirectAttributes redirectAttr) {

		log.debug("reviewBoard = {}", reviewBoard);

		List<ReviewAttach> boardAttachList = new ArrayList<>();

		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		Matcher match = pattern.matcher(reviewBoard.getRewBoContent());

		List<String> img = new ArrayList<>();

		// 이미지 태그 추출 <img src=~~~~>
		while (match.find()) {
			img.add(match.group());
		}
		log.debug("img = {}", img);
		for (String s : img) {
			// 서버에 저장될 파일이름
			int startRname = s.indexOf("multiupload/");
			int endRname = s.indexOf("\"", startRname);
			String rName = s.substring(startRname + 12, endRname);

			// 사용자가 업로드한 파일이름
			int startOname = s.indexOf("\"", endRname + 1);
			int endOname = s.lastIndexOf("\"");
			String oName = s.substring(startOname + 1, endOname);

			ReviewAttach attach = new ReviewAttach();
			attach.setRewAtOriginalName(oName);
			attach.setRewAtRenamedName(rName);
			// 리스트로 만들기
			boardAttachList.add(attach);
		}
		log.debug("boardAttachList = {}", boardAttachList);

		reviewBoard.setAttachList(boardAttachList);
		// 2. 게시글, 첨부파일정보를 DB에 저장
		try {
			int result = reviewBoardService.insertReviewBoard(reviewBoard);

			redirectAttr.addFlashAttribute("msg", "게시글 등록 성공!");
		} catch (Exception e) {
			log.error("게시물 등록  오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글 등록 실패!");

     		throw e;
		}

		return "redirect:/reviewBoard/reviewBoard.do";
	}
	  
	
	  //게시글조회
	  @GetMapping("/reviewBoardView.do") 
	  public ModelAndView ReviewBoardView(@RequestParam int no, ModelAndView mav) {
	  log.debug("[{}]번 게시글 조회!", no);
	  
	  //게시글 번호로 조회 
	  ReviewBoard reviewBoard = reviewBoardService.selectOneBoard(no);
	  mav.addObject("reviewBoard", reviewBoard);
	  log.debug("reviewBoard = {}", reviewBoard);


		mav.setViewName("reviewBoard/reviewBoardView");
		return mav;
	 
	  }
	
		//게시글수정 뷰
		@GetMapping("/updateFrm.do")
		public ModelAndView updateFrm(@RequestParam("no") int no, ModelAndView mav) {
			ReviewBoard reviewBoard = reviewBoardService.selectOneBoard(no);
			
			mav.addObject("reviewBoard", reviewBoard);
			log.debug("reviewBoard = {}", reviewBoard);
			
			
			mav.setViewName("reviewBoard/updateFrm");
			return mav;	
		}
		

	    //게시글 삭제
		@GetMapping("/deleteBoard")
		public String deleteBoard(@RequestParam("no") int no, RedirectAttributes redirectAttr) {
		
		try {
			int result = reviewBoardService.deleteBoard(no);
			redirectAttr.addFlashAttribute("msg", "게시글 삭제 완료");
		} catch(Exception e) {
			log.error("게시글 삭제 오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글 삭제 실패");
		}
		return "redirect:/reviewBoard/reviewBoard.do";
		}
	
		//게시글 수정
		@PostMapping("/updateBoard.do")
		public ModelAndView updateBoard(ModelAndView mav, ReviewBoard reviewBoard, HttpServletRequest req, RedirectAttributes redirectAttr) {
			log.debug("reviewBoard = {}", reviewBoard);
			
			
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

			Matcher match = pattern.matcher(reviewBoard.getRewBoContent());
			
			List<String> imgTag = new ArrayList<>();
			List<ReviewAttach> attachList = new ArrayList<>();
			
			//게시물 내용에서 img태그 추출
			while(match.find()) {
				imgTag.add(match.group());
			}
			
			for(String s : imgTag) {
				//img태그에서 서버에 저장된 파일이름
				int startRname = s.indexOf("multiupload/");
				int endRname = s.indexOf("\"", startRname);
				String rName = s.substring(startRname+12, endRname);
				//사용자가 올린 파일이름
				int startOname = s.indexOf("\"", endRname+1);
				int endOname = s.lastIndexOf("\"");
				String oName = s.substring(startOname+1, endOname);
				ReviewAttach attach = new ReviewAttach();
				attach.setRewAtOriginalName(oName);
				attach.setRewAtRenamedName(rName);
				attachList.add(attach);
			}
			//reviewBoard vo에 list로 넣기
			reviewBoard.setAttachList(attachList);

			try {
				//기존파일지우고 다시쓰기
				int result1 = reviewBoardService.deleteAttach(reviewBoard.getRewBoId());
				int result2 = reviewBoardService.updateBoard(reviewBoard);
				redirectAttr.addFlashAttribute("msg", "게시글 수정 성공");
			} catch(Exception e) {
				log.error("게시글 수정 오류", e);
				redirectAttr.addFlashAttribute("msg", "게시글수정 실패");
			}
			
			mav.setViewName("redirect:/reviewBoard/reviewBoardView.do?no="+reviewBoard.getRewBoId());
			return mav;
		}
	}
	  

