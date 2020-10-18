package com.kh.petever.reviewBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.common.Utils;
import com.kh.petever.reviewBoard.model.service.ReviewBoardService;
import com.kh.petever.reviewBoard.model.vo.ReviewPhoto;
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
		final int limit = 12;
		int offset = (cPage - 1) * limit;

		List<ReviewBoard> list = reviewBoardService.selectReviewBoard(limit, offset);
		
		//전체컨텐츠수 구하기
		int totalContents = reviewBoardService.reviewBoardCount();

		//첨부파일조회
		List<ReviewAttach> attachList = reviewBoardService.selectAttachList();
		
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
						
		log.debug("list = {}", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("attachList", attachList);
		
		return "reviewBoard/reviewBoard";
	}
	
	//게시글 사진으로 조회
	@GetMapping("/reviewBoardPhoto.do")
	public String reviewBoardPhoto(Model model, @RequestParam(defaultValue = "1") int cPage, HttpServletRequest request) {
		final int limit = 12;
		int offset = (cPage - 1) * limit;
		
		//전체게시글 조회하기
		List<ReviewBoard> list = reviewBoardService.selectReviewBoard(limit, offset);
		
		//전체컨텐츠수 구하기
		int totalContents = reviewBoardService.reviewBoardCount();

		//첨부파일조회
		List<ReviewAttach> attachList = reviewBoardService.selectAttachList();
		
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
						
		log.debug("list = {}", list);
		log.debug("attachList = {}", attachList);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("attachList", attachList);
		System.out.println();
		
		return "reviewBoard/reviewBoardPhoto";

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
	  
	
	  //게시글 조회
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
		//List<ReviewAttach> list = reviewBoardService.selectAttachListOneBoard(no);
		try {
			int result = reviewBoardService.deleteBoard(no);
			redirectAttr.addFlashAttribute("msg", "게시글 삭제 완료");
			//사진 삭제
		//	for(ReviewAttach attach : list) {
		//		File f = new File(filePath, attach.getRewAtRenamedName());
		//		f.delete();
		//	}
			
		} catch(Exception e) {
			log.error("게시글 삭제 오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글 삭제 실패");
		}
		return "redirect:/reviewBoard/reviewBoardPhoto.do";
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
			//신고하기
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

			@RequestMapping("/index")
			public @ResponseBody Map<String, Object> index(Model model) {
				
				//전체 게시글 조회
				List<ReviewBoard> boardList = reviewBoardService.selectBoardListOneWeek();
				log.debug("boardList = {}", boardList);
				//첨부파일조회
				List<ReviewAttach> attachList = reviewBoardService.selectAttachList();
				log.debug("attachList = {}", attachList);
				model.addAttribute("boardList", boardList);
				model.addAttribute("attachList", attachList);
				
				Map<String, Object> result = new HashMap<>();
				result.put("boardList", boardList);
				result.put("attachList", attachList);
				
				return result;
			}			
			
			//이 아래로는 파일 관련
			@RequestMapping("/file_uploader")
			public String file_uploader(HttpServletRequest request, HttpServletResponse response, ReviewPhoto photo){
				String return1=request.getParameter("callback");
				String return2="?callback_func=" + request.getParameter("callback_func");
				String return3="";
				String name = "";
				try {
					if(photo.getFiledata() != null 
							&& photo.getFiledata().getOriginalFilename() != null 
							&& !photo.getFiledata().getOriginalFilename().equals("")) {
						// 기존 상단 코드를 막고 하단코드를 이용
						name = photo.getFiledata().getOriginalFilename().substring(photo.getFiledata().getOriginalFilename().lastIndexOf(File.separator)+1);
						String filename_ext = name.substring(name.lastIndexOf(".")+1);
						filename_ext = filename_ext.toLowerCase();
						String[] allow_file = {"jpg","png","bmp","gif"};
						int cnt = 0;
						for(int i=0; i<allow_file.length; i++) { 
							if(filename_ext.equals(allow_file[i])){ 
								cnt++; 
								}
							}
						if(cnt == 0) {
							return3 = "&errstr="+name;
						} else {
							//파일 기본경로
							String dftFilePath = request.getSession().getServletContext().getRealPath("/");
							//파일 기본경로 _ 상세경로
							String filePath = dftFilePath + "resources"+ File.separator + "editor" + File.separator +"upload" + File.separator;
							File file = new File(filePath);
							if(!file.exists()) { 
								file.mkdirs();
							} 
							String realFileNm = "";
							SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
							String today= formatter.format(new java.util.Date());
							realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
							String rlFileNm = filePath + realFileNm;
							///////////////// 서버에 파일쓰기 /////////////////
							photo.getFiledata().transferTo(new File(rlFileNm));
							///////////////// 서버에 파일쓰기 /////////////////
							return3 += "&bNewLine=true";
							return3 += "&sFileName="+ name;
							return3 += "&sFileURL=/resources/editor/upload/"+realFileNm;
						}
					}else {
						return3 += "&errstr=error";
					} 
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "redirect:"+return1+return2+return3;
			}
	
			@RequestMapping("/file_uploader_html5")
			public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
				try { 
					//파일정보 
					String sFileInfo = "";
					//파일명을 받는다 - 일반 원본파일명
					String filename = request.getHeader("file-name");
//					System.out.println(filename);
					//파일 확장자
					String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
					//확장자를소문자로 변경
					filename_ext = filename_ext.toLowerCase();
					//이미지 검증 배열변수
					String[] allow_file = {"jpg","png","bmp","gif"};
					//돌리면서 확장자가 이미지인지
					int cnt = 0;
					for(int i=0; i<allow_file.length; i++) {
						if(filename_ext.equals(allow_file[i])){
							cnt++;
						}
					} //이미지가 아님
					if(cnt == 0) {
						PrintWriter print = response.getWriter();
						print.print("NOTALLOW_"+filename);
						print.flush();
						print.close();
					} else {
						//이미지이므로 신규 파일로 디렉토리 설정 및 업로드
						
						//파일 기본경로
						String filePath = request.getServletContext().getRealPath("/resources/editor/multiupload/");
						
						File file = new File(filePath);
						
						if(!file.exists()) {
							file.mkdirs();
						}
						String realFileNm = "";
						SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
						String today= formatter.format(new java.util.Date());
						realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
						String rlFileNm = filePath + realFileNm;

						//////////////// 서버에 파일쓰기 /////////////////
						InputStream is = request.getInputStream();
						OutputStream os = new FileOutputStream(rlFileNm);
						int numRead;
						byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
						while((numRead = is.read(b,0,b.length)) != -1){
							os.write(b,0,numRead);
						}
						if(is != null) { 
							is.close();
						}
						os.flush();
						os.close();
						///////////////// 서버에 파일쓰기 /////////////////
						
						// 정보 출력
						sFileInfo += "&bNewLine=true";
						// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함 
						sFileInfo += "&sFileName="+ filename; 
						sFileInfo += "&sFileURL="+"/petever/resources/editor/multiupload/"+realFileNm;
						
						PrintWriter print = response.getWriter();
						print.print(sFileInfo);
						print.flush();
						print.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
					
					
				}
			}
			
		}
