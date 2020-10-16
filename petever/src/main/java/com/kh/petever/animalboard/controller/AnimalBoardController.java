package com.kh.petever.animalboard.controller;

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

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.animalboard.model.service.AnimalBoardService;
import com.kh.petever.animalboard.model.vo.AdoptApplication;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.animalboard.model.vo.AnimalComment;
import com.kh.petever.animalboard.model.vo.Photo;
import com.kh.petever.common.Utils;
import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AnimalBoardController {
	
	@Autowired
	private AnimalBoardService service;
	
	@GetMapping("/animalboard")
	public ModelAndView animalboardListView(ModelAndView mav, @RequestParam(defaultValue="1", value="cPage") int cPage,  HttpServletRequest request) {
		final int limit = 16;
		int offset = (cPage-1)*limit;
		
		//전체 게시글 조회
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AnimalBoard> boardList = service.selectBoardList(rowBounds);
		log.debug("boardList = {}", boardList);
		//첨부파일조회
		List<AnimalAttach> attachList = service.selectAttachList();
		int totalContents = service.animalBoardCount();
		
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		mav.addObject("pageBar", pageBar);
		mav.addObject("boardList", boardList);
		mav.addObject("attachList", attachList);
		
		mav.setViewName("animalBoard/mp-board");
		return mav;
	}
	
	@GetMapping("/animalboard/boardView")
	public ModelAndView animalboardView(@RequestParam int no, ModelAndView mav) {
		log.debug("{}번 게시글 조회", no);
		
		//no번 게시글 조회
		AnimalBoard animalBoard = service.selectOneBoard(no);
		mav.addObject("animalBoard", animalBoard);
		log.debug("animalBoard = {}", animalBoard);
		
		//no번 게시글과 보호소 동물 조회
		List<ShelterAnimal> shelterAniList = service.selectShelterAnimalList(animalBoard);
		log.debug("shelterAniList={}", shelterAniList);
		mav.addObject("shelterAniList", shelterAniList);
		
		//no번 게시글의 댓글
		int totalComment = service.totalComment(no);
		mav.addObject("totalComment", totalComment);
		List<AnimalComment> commentList = service.selectCommentList(no);
		mav.addObject("commentList", commentList);
		
		mav.setViewName("animalBoard/mp-board-view");
		return mav;
	}
	
	@GetMapping("/animalboard/boardFrm")
	public String animalboardFrm() {
		return "animalBoard/mp-boardFrm";
	}
	
	@RequestMapping("/animalboard/insertBoard") 
	public String insertBoard(AnimalBoard animal, RedirectAttributes redirectAttr, HttpServletRequest req){
		//로그인한 사용자 아이디
		log.debug("animal = {}", animal);
		
		String sido = (String)req.getParameter("sido");
		String sigugun = (String)req.getParameter("sigugun");
		animal.setAniBoLocal(sido + " " + sigugun);
		
		List<AnimalAttach> boardAttachList = new ArrayList<>();
		
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		Matcher match = pattern.matcher(animal.getAniBoContent());
		
		List<String> img = new ArrayList<>();
		
		//이미지 태그 추출 <img src=~~~~>
		while(match.find()) {
			img.add(match.group());
		}
		
		for(String s : img) {
			//서버에 저장될 파일이름
			int startRname = s.indexOf("multiupload/");
			int endRname = s.indexOf("\"", startRname);
			String rName = s.substring(startRname+12, endRname);
			
			//사용자가 업로드한 파일이름
			int startOname = s.indexOf("\"", endRname+1);
			int endOname = s.lastIndexOf("\"");
			String oName = s.substring(startOname+1, endOname);
			
			AnimalAttach attach = new AnimalAttach();
			attach.setAniAtOriginalName(oName);
			attach.setAniAtRenamedName(rName);
			//리스트로 만들기
			boardAttachList.add(attach);
		}
		log.debug("boardAttachList = {}", boardAttachList);
		
		//animalBoard vo에 list로 넣기
		animal.setAttachList(boardAttachList);
		
		try {
			int result = service.insertBoard(animal);
			redirectAttr.addFlashAttribute("msg", "게시글 등록 성공");
		} catch(Exception e) {
			log.error("게시글 등록 오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글 등록 실패");
		}
		return "redirect:/animalboard";
	}
	
	@GetMapping("/animalboard/deleteBoard")
	public String deleteBoard(@RequestParam("no") int no, RedirectAttributes redirectAttr, HttpServletRequest request) {
//		log.debug("no = {}", no);
		String filePath = request.getServletContext().getRealPath("/resources/editor/multiupload/");
		List<AnimalAttach> list = service.selectAttachListOneBoard(no);
		try {
			int result = service.deleteBoard(no);
			redirectAttr.addFlashAttribute("msg", "게시글 삭제 완료");
			//사진 삭제
			for(AnimalAttach attach : list) {
				File f = new File(filePath, attach.getAniAtRenamedName());
				f.delete();
			}
		} catch(Exception e) {
			log.error("게시글 삭제 오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글 삭제 실패");
		}
		return "redirect:/animalboard";
	}
	
	@GetMapping("/animalboard/updateBoardFrm")
	public ModelAndView updateBoardFrm(@RequestParam("no") int no, ModelAndView mav) {
		AnimalBoard animalBoard = service.selectOneBoard(no);
		
		mav.addObject("animalBoard", animalBoard);
		log.debug("animalBoard = {}", animalBoard);
		
		mav.setViewName("animalBoard/mp-board-updateFrm");
		return mav;
	}
	
	@PostMapping("/animalboard/updateBoard")
	public ModelAndView updateBoard(ModelAndView mav, AnimalBoard animal, HttpServletRequest req, RedirectAttributes redirectAttr) {
		log.debug("animal = {}", animal);
		
		//지역처리
		String sido = req.getParameter("sido");
		String sigugun = req.getParameter("sigugun");
		animal.setAniBoLocal(sido + " " + sigugun);
		
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		Matcher match = pattern.matcher(animal.getAniBoContent());
		
		List<String> imgTag = new ArrayList<>();
		List<AnimalAttach> attachList = new ArrayList<>();
		
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
			AnimalAttach attach = new AnimalAttach();
			attach.setAniAtOriginalName(oName);
			attach.setAniAtRenamedName(rName);
			attachList.add(attach);
		}
		//animalBoard vo에 list로 넣기
		animal.setAttachList(attachList);
		try {
			//기존파일지우고 다시쓰기....
			int result1 = service.deleteAttach(animal.getAniBoId());
			int result2 = service.updateBoard(animal);
			redirectAttr.addFlashAttribute("msg", "게시글 수정 성공");
		} catch(Exception e) {
			log.error("게시글 수정 오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글수정 실패");
		}
		
		mav.setViewName("redirect:/animalboard/boardView?no="+animal.getAniBoId());
		return mav;
	}
	
	@PostMapping("/animalboard/insertComment")
	public String insertComment(AnimalComment aniComment, RedirectAttributes redirectAttr) {
		log.debug("aniC = {}", aniComment);
		
		try {
			int result = service.insertComment(aniComment);
			redirectAttr.addFlashAttribute("msg", "댓글 등록 성공");
		} catch(Exception e) {
			log.error("댓글 등록 오류", e);
			redirectAttr.addFlashAttribute("msg", "댓글 등록 실패");
		}
		
		return "redirect:/animalboard/boardView?no="+aniComment.getAniBoId();
	}
	
	@GetMapping("/animalboard/deleteComment")
	public String deleteComment(@RequestParam("no") int no,@RequestParam("commentNo") int commentNo, RedirectAttributes redirectAttr) {
		log.debug("no = {}, boardId={}", no, commentNo);
		
		try {
			int result = service.deleteComment(commentNo);
			redirectAttr.addFlashAttribute("msg", "댓글 삭제 완료");
		} catch(Exception e) {
			log.error("댓글 삭제 오류", e);
			redirectAttr.addFlashAttribute("msg", "댓글 삭제 실패");
		}
		
		return "redirect:/animalboard/boardView?no="+no;
	}
	
	@PostMapping("/animalboard/editComment")
	public String editComment(AnimalComment aniComment, RedirectAttributes redirectAttr) {
		log.debug("aniComment = {}", aniComment);
		
		try {
			int result = service.editComment(aniComment);
			redirectAttr.addFlashAttribute("msg", "댓글 수정 완료");
		} catch(Exception e) {
			log.error("댓글 수정 오류", e);
			redirectAttr.addFlashAttribute("msg", "댓글 수정 실패");
		}
		return "redirect:/animalboard/boardView?no="+aniComment.getAniBoId();
	}
	
	//검색 ajax
	@PostMapping("/animalboard/search")
	public @ResponseBody Map<String, Object> search(HttpServletRequest req, AnimalBoard animal) {
		//사용자 입력값
		Map<String, Object> param = new HashMap<>();
		String sido = req.getParameter("sido");
		String sigugun = req.getParameter("sigugun");
		String aniBoLocal = sido + " " + sigugun;
		if(sido == null || "".equals(sido))
			aniBoLocal = null;
		
		String aniBoTitle = (String)req.getParameter("aniBoTitle");
		String aniBoTag = (String)req.getParameter("aniBoTag");
		String aniBoContent = req.getParameter("aniBoContent");
		String aniBoKind = req.getParameter("aniBoKind");
		String[] aniBoType = req.getParameterValues("aniBoType");
		String[] aniBoGender = req.getParameterValues("aniBoGender");
		String aniBoAge = req.getParameter("aniBoAge");
		String aniBoSize = req.getParameter("aniBoSize");
		String[] aniBoColor = req.getParameterValues("aniBoColor");
		String[] aniBoHair = req.getParameterValues("aniBoHair");
		param.put("aniBoTitle", aniBoTitle);
		param.put("aniBoTag", aniBoTag);
		param.put("aniBoContent", aniBoContent);
		param.put("aniBoLocal", aniBoLocal);
		param.put("aniBoType", aniBoType);
		param.put("aniBoGender", aniBoGender);
		param.put("aniBoAge", aniBoAge);
		param.put("aniBoSize", aniBoSize);
		param.put("aniBoColor", aniBoColor);
		param.put("aniBoHair", aniBoHair);
		param.put("aniBoKind", aniBoKind);
		log.debug("param = {}", param);
		
		//업무로직
		List<AnimalBoard> boardList = service.searchBoardList(param);
		List<AnimalAttach> fileList = service.selectAttachList();
//		log.debug("boardList = {}", boardList);
//		log.debug("fileList = {}", fileList);

		//뷰단 처리
		Map<String, Object> result = new HashMap<>();
		result.put("boardList", boardList);
		result.put("fileList", fileList);
		
		return result;
	}
	
	@RequestMapping("/animalboard/index")
	public @ResponseBody Map<String, Object> index(Model model) {
		
		//전체 게시글 조회
		List<AnimalBoard> boardList = service.selectBoardListOneWeek();
		log.debug("boardList = {}", boardList);
		//첨부파일조회
		List<AnimalAttach> attachList = service.selectAttachList();
		log.debug("attachList = {}", attachList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("attachList", attachList);
		
		Map<String, Object> result = new HashMap<>();
		result.put("boardList", boardList);
		result.put("attachList", attachList);
		
		return result;
	}
	
	@GetMapping("/apply/adopt")
	public ModelAndView adoptFrm(@RequestParam("no") int no, ModelAndView mav) {
		AnimalBoard animal = service.selectOneBoard(no);
		mav.addObject("animal", animal);
		log.debug("animal = {}", animal);
		
		mav.setViewName("adopt/adoption-application");
		return mav;
	}
	
	@PostMapping("/apply/insertApplication")
	public String insertApplication(AdoptApplication application, RedirectAttributes redirectAttr) {
		log.debug("application = {}", application);
		try {
			int result = service.insertApplication(application);
			redirectAttr.addFlashAttribute("msg", "신청 완료");
		} catch(Exception e) {
			log.error("입양 신청 오류", e);
			redirectAttr.addFlashAttribute("msg", "신청 실패");
		}
		
		return "redirect:/animalboard/boardView?no=" + application.getAniBoId();
	}
	
	@GetMapping("/apply/applicationView")
	public ModelAndView selectOneApplication(@RequestParam("no") int no , ModelAndView mav) {
		
		AdoptApplication application = service.selectOneApplication(no);

		mav.addObject("adopt", application);
		mav.setViewName("adopt/adoption-application-view");
		return mav;
	}
	
	@GetMapping("/animalboard/reportFrm")
	public ModelAndView reportFrm(@RequestParam("no") int no, @RequestParam("doUser") String doUser, ModelAndView mav) {
		AnimalBoard animal = service.selectOneBoard(no);
		Map<String, Object> param = new HashMap<>();
		param.put("aniBoId", no);
		param.put("repDoUser", doUser);
		
		Report rep = service.selectOneReport(param);
		log.debug("rep = {}", rep);
		mav.addObject("animal",  animal);
		mav.addObject("doUser", doUser);
		mav.addObject("rep", rep);
		
		mav.setViewName("animalBoard/report");
		return mav;
	}
	
	@PostMapping("/animalboard/report")
	public @ResponseBody Map<String, Object> insertReport(@RequestBody Report rep) {
		log.debug("rep = {}", rep);
		String msg = "신고 완료";
		try {
			int result = service.insertReport(rep);
		} catch(Exception e) {
			log.error("신고 오류", e);
			msg = "신고 실패";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("msg", msg);
		
		return map;
	}

	//이 아래로는 파일 관련
	@RequestMapping("/file_uploader")
	public String file_uploader(HttpServletRequest request, HttpServletResponse response, Photo photo){
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
//			System.out.println(filename);
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
//				String dftFilePath1 = request.getSession().getServletContext().getRealPath("/");
//				log.debug("filePath = {} ", filePath);
//				
				//방법2
//				@Autowired
//				ServletContext servletContext;
//				String dftFilePath2 = servletContext.getRealPath("/");
				
//				//방법3
				//servlet-context.xml에서 파일 위치 직접 적어주고
				//@Resource(name="uploadPath")
				//String uploadPath;
//				log.debug("uploadPath = {}", uploadPath);
				
				File file = new File(filePath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				String realFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
				String rlFileNm = filePath + realFileNm;
//				System.out.println(realFileNm);
//				System.out.println(rlFileNm);
				
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
