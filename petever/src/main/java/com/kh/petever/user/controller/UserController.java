package com.kh.petever.user.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petever.user.model.service.UserService;
import com.kh.petever.user.model.vo.User;

@Controller
@RequestMapping("/user")

public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value = "/signup.do",
			method = RequestMethod.GET)
	public String userSignup() {
		return "user/signup";
	}
	
	//회원가입 폼을 제출했을때 처리할 핸들러
	@RequestMapping(value ="/signup.do",
					method = RequestMethod.POST)
	public String userSignup(User user,
						RedirectAttributes redirectAttr) {
		
		System.out.println("user@controller = " + user);
		
		String rawPassword = user.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encryptPassword);
		System.out.println("rawPassword@controller = " + rawPassword);
		System.out.println("encryptPassword@controller = " + encryptPassword);
		
				//1.비지니스로직 실행
				int result = userService.insertUser(user);
				
				//2.RedirectAttributes를 통한 사용자 알림처리
				String msg = (result > 0) ? "회원가입성공!" : "회원가입성공!";
				System.out.println("msg@controller = " + msg);
				redirectAttr.addFlashAttribute("msg", msg);
		
		
		return "redirect:/";
		
	}
	
	/**
	 * 사용자요청을 command vo에 바인딩할 때 세부설정함
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, 
									new CustomDateEditor(sdf, true));
		//공란 허용여부 : 오류없이 처리 
		
	}
	
	//회원정보수정페이지 연결
	@GetMapping("/user.do")
	public String user() {
		
		System.out.println("접속");
		return "user/user";

	}
	
	//로그인페이지연결
	@GetMapping("/login.do")
	public String login() {
		
		System.out.println("접속");
		return "user/login";

	}

}

