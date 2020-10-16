package com.kh.petever.message.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.message.model.service.MessageService;
import com.kh.petever.message.model.vo.Message;
//import com.kh.petever.reviewBoard.model.vo.ReviewBoard;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MessageController {
	
	@Autowired 
	private MessageService messageService;
//	@Autowired
//	private AnimalBoard animalBoard;
//	@Autowired
//	private ReviewBoard reviewBoard;
	
	
	@RequestMapping("/message/messageList.do")
	public ModelAndView msglist(ModelAndView mav, 
								@RequestParam(defaultValue = "1",
												value="cPage") int cPage,
									HttpSession session) {
		
				//1.사용자 입력값 
				final int limit = 10;
				int offset = (cPage - 1) * limit;
				
				//2. 업무로직
				List<Message> messageList = messageService.selectMessageList(limit, offset);
				log.debug("list = {}", messageList);
				
				//전체컨텐츠수 구하기
				int totalContents = messageService.selectMessageTotalContents();
				
				session.getAttribute("userId");
				
				//3. view단 처리
				mav.addObject("totalContents", totalContents);
				mav.addObject("list", messageList);
				mav.setViewName("message/messageList");
		
		return mav;
	}
	
	@RequestMapping("/message/messageForm.do")
	public ModelAndView messageForm(@RequestParam("receiveId")String receiveId, ModelAndView mav) {
		
//		mav.addObject("sendId1",animalBoard.getUserId());
//		mav.addObject("sendId2",reviewBoard.getUserId());
		
		mav.setViewName("message/messageForm");
		mav.addObject("receiveId", receiveId);
		return mav;
	}
	
	
	@RequestMapping("/message/insertmessage") 
	public String insertBoard(Message message, RedirectAttributes redirectAttr, HttpServletRequest req){
		//로그인한 사용자 아이디
		log.debug("Message = {}", message);
		
		
		try {
			int result = messageService.insertMessage(message);
			redirectAttr.addFlashAttribute("msg", "게시글 등록 성공");
		} catch(Exception e) {
			log.error("게시글 등록 오류", e);
			redirectAttr.addFlashAttribute("msg", "게시글 등록 실패");
		}
		return "close();";
	}
	
	
	
	
	

}
