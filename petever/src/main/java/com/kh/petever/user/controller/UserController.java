package com.kh.petever.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {
	
	//회원가입페이지연결
	@GetMapping("/signup.do")
	public String signup() {
		log.debug("접속");
		System.out.println("접속");
		return "user/signup";
	}
	
	//회원정보수정페이지 연결
	@GetMapping("/user.do")
	public String user() {
		log.debug("접속");
		System.out.println("접속");
		return "user/user";

	}
	
	//로그인페이지연결
	@GetMapping("/login.do")
	public String login() {
		log.debug("접속");
		System.out.println("접속");
		return "user/login";

	}
}
