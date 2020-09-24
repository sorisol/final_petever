package com.kh.petever.animalboard.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petever.animalboard.model.vo.Photo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AnimalBoardController {
	
	@GetMapping("/animalboard")
	public String animalboardList() {
		return "animalBoard/mp-board";
	}
	
	@GetMapping("/animalboard/boardView")
	public String animalboardView() {
		return "animalBoard/mp-board-view";
	}
	
	@GetMapping("/animalboard/boardFrm")
	public String animalboardFrm() {
		return "animalBoard/mp-boardFrm";
	}
	
	@RequestMapping("/animalboard/insertBoard") 
	public String insertBoard(@RequestParam("ani_bo_tag")String tag, @RequestParam("ani_bo_title")String title, @RequestParam("board-content")String content
							){
		log.debug("tag: {}, title:  {}", tag, title);
		log.debug("{}", content);
		return "/";
	}
	
//	@RequestMapping("/animalboard/fileUpload")
//	public String photoUpload(HttpServletRequest request, Photo photo) {
//		String callback = photo.getCallback();
//		String callback_func = photo.getCallback_func();
//		String file_result = "";
//		try {
//			if(photo.getFiledata() != null 
//					&& photo.getFiledata().getOriginalFilename() != null
//					&& !photo.getFiledata().getOriginalFilename().equals("")) {
//				String original_name = photo.getFiledata().getOriginalFilename();
//				String ext = original_name.substring(original_name.lastIndexOf(".")+1);
//				
//				String defaultPath = request.getSession().getServletContext().getRealPath("/");
//				String path = defaultPath + "resource" + File.separator + "photo_upload" + File.pathSeparator;
//				File file = new File(path);
//				
//				if(!file.exists()) {
//					file.mkdirs();
//				}
//				
//				String realName = UUID.randomUUID().toString() + "." + ext;
//				
//				photo.getFiledata().transferTo(new File(path+realName));
//				file_result += "&bNewLine=true&sFileName="+original_name + "&sFileURL=/resource/photo_upload/"+realName;
//			}
//			else {
//				file_result += "&errstr=error";
//			}
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
//	}
	
}
