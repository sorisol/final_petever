package com.kh.petever.user.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petever.user.model.service.UserService;
import com.kh.petever.user.model.vo.User;

@Controller
@RequestMapping("/user")
@SessionAttributes(value = { "loginUser" })
public class UserController {
	
	private Logger log = 
			LoggerFactory.getLogger(getClass());
	
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
		
		log.debug("user@controller = {}", user);
		
		String rawPassword = user.getUserPwd();
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		user.setUserPwd(encryptPassword);
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
	
	//로그인 페이지 연결
	@RequestMapping("/login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value = "/login.do",
					method = RequestMethod.POST)
	public String userLogin(@RequestParam String userId,
							@RequestParam String userPwd,
							Model model,
							RedirectAttributes redirectAttr,
							HttpSession session) {
		
		log.debug("userId = {}, userPwd = {}", userId, userPwd);
		
		User user = userService.selectOneUser(userId);
		log.debug("user = {}", user);
		
		String location = "/";
		
		
		
		//로그인 성공
		if(user != null && bcryptPasswordEncoder.matches(userPwd, user.getUserPwd())) {
		
		model.addAttribute("loginUser", user);
		
		String next = (String)session.getAttribute("next");
		location = next != null ? next : location;
		session.removeAttribute("next");
		
		
	
		//로그인 실패
		}else {
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			
		}
		
		return "redirect:/";
	}
	
	//로그아웃 - 세션 무효화
	@RequestMapping("/logout.do")
	public String userLogout(SessionStatus sessionStatus) {
		//@SessionAttribute를 통해 등록된 객체 무효화
		if(sessionStatus.isComplete() == false)
			sessionStatus.setComplete();
		
		return "redirect:/";
		
	}
	
	//회원정보수정페이지 연결
	@GetMapping("/user.do")
	public String user() {
		
		System.out.println("접속");
		return "user/user";

		}


	}


