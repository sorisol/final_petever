package com.kh.petever.message.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petever.message.model.service.MessageService;
import com.kh.petever.message.model.vo.Message;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/message")
@Slf4j
public class MessageController {
	
	@Autowired 
	private MessageService messageService;
	
	
	@RequestMapping("/messageList.do")
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
	
	

}
