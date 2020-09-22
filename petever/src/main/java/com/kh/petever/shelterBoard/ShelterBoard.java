package com.kh.petever.shelterBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shelterBoard")
@Slf4j
public class ShelterBoard {
	
	//보소호 게시판 주석테스트
	@GetMapping("/shelterBoard.do")
	public String shelterBoard() {
		log.debug("111");
		
		return "shelterBoard/shelterBoard";
	}

}
