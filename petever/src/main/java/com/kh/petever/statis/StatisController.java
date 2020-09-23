package com.kh.petever.statis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/statis")
@Slf4j
public class StatisController {
	
	@GetMapping("/statis.do")
	public String shelterBoard() {
		log.debug("접속");
		System.out.println("접속");
		return "statistics/statis";
	}

}
