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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petever.animalboard.model.service.AnimalBoardService;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.animalboard.model.vo.Photo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AnimalBoardController {
	
	private Map<String, String> fileNameMap = new HashMap<>();
	
	@Autowired
	private AnimalBoardService service;
	
	@GetMapping("/animalboard")
	public ModelAndView animalboardListView(ModelAndView mav, @RequestParam(defaultValue="1", value="cPage") int cPage) {
		final int limit = 16;
		int offset = (cPage-1)*limit;
		
		List<AnimalBoard> boardList = service.selectBoardList(limit, offset);
		log.debug("boardList = {}", boardList);
		mav.addObject("boardList", boardList);
		
		mav.setViewName("animalBoard/mp-board");
		return mav;
	}
	
	@GetMapping("/animalboard/boardView")
	public String animalboardView(@RequestParam int no,Model model) {
		log.debug("{}번 게시글 조회", no);
		
		AnimalBoard animalBoard = service.selectOneBoard(no);
		log.debug("animalBoard = {}", animalBoard);
		
		return "animalBoard/mp-board-view";
	}
	
	@GetMapping("/animalboard/boardFrm")
	public String animalboardFrm() {
		return "animalBoard/mp-boardFrm";
	}
	
	@RequestMapping("/animalboard/insertBoard") 
	public String insertBoard(AnimalBoard animal, RedirectAttributes redirectAttr){
		//로그인한 사용자 아이디
		animal.setUserId("honggd");
		log.debug("animal = {}", animal);
		log.debug("map = {}", fileNameMap);
		
		List<AnimalAttach> boardAttachList = new ArrayList<>();
		//파일 이름을 AnimalAttach vo에저장
		for(int i=0; i<fileNameMap.size(); i++) {
			AnimalAttach attach = new AnimalAttach();
			attach.setAniAtOriginalName(fileNameMap.get("aniAtOriginalName"));
			attach.setAniAtRenamedName(fileNameMap.get("aniAtRenamedName"));
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
			log.error("게시물 등록 오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글 등록 실패");
		}
		return "redirect:/animalboard";
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
				log.debug("filePath = {} ", filePath);
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
				//////////////// 서버에 파일쓰기 /////////////////
				InputStream is = request.getInputStream();
				OutputStream os=new FileOutputStream(rlFileNm);
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
				log.debug("sFileInfo = {}", sFileInfo);
				PrintWriter print = response.getWriter();
				print.print(sFileInfo);
				print.flush();
				print.close();
				
//				log.debug("filename = " + filename);
//				log.debug("rfilename = " + realFileNm);
				
				fileNameMap.put("aniAtOriginalName", filename);
				fileNameMap.put("aniAtRenamedName", realFileNm);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		Map<String, String> fileNameMap = new HashMap<>();
//		return fileNameMap;
	}
}
