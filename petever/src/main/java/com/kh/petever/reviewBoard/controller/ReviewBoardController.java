package com.kh.petever.reviewBoard.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.common.Utils;
import com.kh.petever.reviewBoard.model.service.ReviewBoardService;
import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;
import com.kh.petever.reviewBoard.model.vo.ReviewComment;

/*import jdk.internal.org.jline.utils.Log;*/
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/reviewBoard")
@Slf4j
public class ReviewBoardController {

	@Autowired
	private ReviewBoardService reviewBoardService;

	// 입양후기 게시판 연결
	@GetMapping("/reviewBoard.do")
	public String reviewBoardList(Model model, @RequestParam(defaultValue = "1") int cPage, HttpServletRequest request) {
		final int limit = 10;
		int offset = (cPage - 1) * limit;

		List<ReviewBoard> list = reviewBoardService.selectReviewBoard(limit, offset);
		int totalContents = reviewBoardService.reviewBoardCount();
		//count(*) from review_board
		String url = request.getRequestURI() + "?";
		 String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		
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

		//no번 게시글의 댓글
		int totalComment = reviewBoardService.totalComment(no);
		mav.addObject("totalComment", totalComment);
		List<ReviewComment> commentList = reviewBoardService.selectCommentList(no);
		mav.addObject("commentList", commentList);
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
		public String deleteBoard(@RequestParam("no") int no, RedirectAttributes redirectAttr, HttpServletRequest request) {
		
		String filePath = request.getServletContext().getRealPath("/resources/editor/multiupload/");
		List<ReviewAttach> list = reviewBoardService.selectAttachListOneBoard(no);
		try {
			int result = reviewBoardService.deleteBoard(no);
			redirectAttr.addFlashAttribute("msg", "게시글 삭제 완료");
			//사진 삭제
			for(ReviewAttach attach : list) {
				File f = new File(filePath, attach.getRewAtRenamedName());
				f.delete();
			}
			
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
		
		//댓글 작성
		@PostMapping("/insertComment.do")
		public String insertComment(ReviewComment reviewComment, RedirectAttributes redirectAttr) {
			log.debug("rewC = {}", reviewComment);
			
			try {
				int result = reviewBoardService.insertComment(reviewComment);
				redirectAttr.addFlashAttribute("msg", "댓글 등록 성공");
			} catch(Exception e) {
				log.error("댓글 등록 오류", e);
				redirectAttr.addFlashAttribute("msg", "댓글 등록 실패");
			}
			
			return "redirect:/reviewBoard/reviewBoardView.do?no="+reviewComment.getRewBoId();
		}
		
	    //댓글 삭제
		@GetMapping("/deleteComment")
		public String deleteComment(@RequestParam("no") int no,@RequestParam("commentNo") int commentNo, RedirectAttributes redirectAttr) {
				log.debug("no = {}, boardId={}", no, commentNo);
			
		try {
			int result = reviewBoardService.deleteComment(commentNo);
			redirectAttr.addFlashAttribute("msg", "댓글 삭제 완료");
		} catch(Exception e) {
			log.error("댓글 삭제 오류", e);
			redirectAttr.addFlashAttribute("msg", "댓글 삭제 실패");
		}
		return "redirect:/reviewBoard/reviewBoardView.do?no="+no;
		}
		
		//댓글 수정
		@PostMapping("/editComment")
		public String editComment(ReviewComment reviewComment, RedirectAttributes redirectAttr) {
			log.debug("reviewComment = {}", reviewComment);
			
			try {
				int result = reviewBoardService.editComment(reviewComment);
				redirectAttr.addFlashAttribute("msg", "댓글 수정 완료");
			} catch(Exception e) {
				log.error("댓글 수정 오류", e);
				redirectAttr.addFlashAttribute("msg", "댓글 수정 실패");
			}
			return "redirect:/reviewBoard/reviewBoardView.do?no="+reviewComment.getRewBoId();
		}
		
			//검색
			@PostMapping("/search.do")
			public @ResponseBody Map<String, Object> search(ReviewBoard reviewBoard) {
		
			//사용자 입력값
			log.debug("reviewBoard = {}", reviewBoard);
			
			//업무로직
			List<ReviewBoard> boardList = reviewBoardService.searchBoardList(reviewBoard);
			List<ReviewAttach> fileList = reviewBoardService.selectAttachList();
//			log.debug("boardList = {}", boardList);
//			log.debug("fileList = {}", fileList);

			//뷰단 처리
			Map<String, Object> result = new HashMap<>();
			result.put("boardList", boardList);
			result.put("fileList", fileList);
			
			return result;
		}
			//신고하기폼
			@GetMapping("/reportFrm.do")
			public ModelAndView reportFrm(@RequestParam("no") int no, @RequestParam("doUser") String doUser, ModelAndView mav) {
				ReviewBoard reviewBoard = reviewBoardService.selectOneBoard(no);
				Map<String, Object> param = new HashMap<>();
				param.put("aniBoId", no);
				param.put("repDoUser", doUser);
				
				Report rep = reviewBoardService.selectOneReport(param);
				log.debug("rep = {}", rep);
				mav.addObject("reviewBoard", reviewBoard);
				mav.addObject("doUser", doUser);
				mav.addObject("rep", rep);
				
				mav.setViewName("reviewBoard/report");
				return mav;
			}
			
			@PostMapping("/report.do")
			public @ResponseBody Map<String, Object> insertReport(@RequestBody Report rep) {
				log.debug("rep = {}", rep);
				String msg = "신고 완료";
				try {
					int result = reviewBoardService.insertReport(rep);
				} catch(Exception e) {
					log.error("신고 오류", e);
					msg = "신고 실패";
				}
				Map<String, Object> map = new HashMap<>();
				map.put("msg", msg);
				
				return map;
			}		
	}
	  

