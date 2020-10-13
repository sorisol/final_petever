package com.kh.petever.user.controller;

import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.petever.user.model.service.KakaoAPI;
import com.kh.petever.user.model.service.UserService;
import com.kh.petever.user.model.vo.User;


@Controller
@RequestMapping("/user")
@SessionAttributes(value = { "loginUser" })
public class UserController {

	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
    private KakaoAPI kakao;
	
	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	private Logger logger;

	//회원가입 get
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String userSignup() {
		return "user/signup";
	}
	
	// 회원가입 post : 회원가입 폼을 제출했을때 처리할 핸들러
	@RequestMapping(value ="/signup.do",
					method = RequestMethod.POST)
	public String userSignup(User user,
						HttpServletRequest req,
						RedirectAttributes redirectAttr) {
		
		log.debug("user@controller = {}", user);
		
		String rawPassword = user.getUserPwd();
		//카카오아이디로 회원가입 했을 경우
		if(user.getUserPwd() == null) {
			rawPassword = "petever";
		}
		
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		user.setUserPwd(encryptPassword);
		System.out.println("rawPassword@controller = " + rawPassword);
		System.out.println("encryptPassword@controller = " + encryptPassword);
		
		//주소
		String addr2 = req.getParameter("addr2");
		String addr3 = req.getParameter("addr3");
		
		user.setUserLocal(addr2 + " " + addr3);
		System.out.println(user);

		//1.비지니스로직 실행
		int result = userService.insertUser(user);
				
		//2.RedirectAttributes를 통한 사용자 알림처리
		String msg = (result > 0) ? "회원가입성공!" : "회원가입성공!";
		System.out.println("msg@controller = " + msg);
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/";
		
	}

	
	@InitBinder
	public void initBinder(WebDataBinder binder) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		// 공란 허용여부 : 오류없이 처리

	}

	// 로그인 페이지 연결
	@RequestMapping("/login.do")
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String userLogin(@RequestParam String userId, @RequestParam String userPwd, Model model,
			RedirectAttributes redirectAttr, HttpSession session) {

		log.debug("userId = {}, userPwd = {}", userId, userPwd);

		User user = userService.selectOneUser(userId);
		log.debug("user = {}", user);

		String location = "/";

		// 로그인 성공
		if (user != null && bcryptPasswordEncoder.matches(userPwd, user.getUserPwd())) {

			model.addAttribute("loginUser", user);

			String next = (String) session.getAttribute("next");
			location = next != null ? next : location;
			session.removeAttribute("next");

			// 로그인 실패
		} else {
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");

		}

		return "redirect:/";
	}

	// 로그아웃 - 세션 무효화

	@RequestMapping("/logout.do")
	public String userLogout(SessionStatus sessionStatus) {
		// @SessionAttribute를 통해 등록된 객체 무효화
		if (sessionStatus.isComplete() == false)
			sessionStatus.setComplete();

		return "redirect:/";

	}

	// 회원정보보기, 수정
	@RequestMapping("/userDetail.do")
	public String userDetail(Principal principal, Model model) {
		log.debug("principal = {}", principal);
		model.addAttribute("loginUser", principal);
		return "user/userDetail";
	}

	@RequestMapping(value = "/userUpdate.do",
				method = RequestMethod.POST)
	public ModelAndView userUpdate(User user,
								 HttpServletRequest req){
	//파라미터로 전달받지 않고 직접 객체 생성 또한 가능
	//viewName 생성자에 전달 가능
	ModelAndView mav = new ModelAndView("redirect:/user/userDetail.do");
	log.debug("user = {}", user);
	
	//주소
	String addr2 = req.getParameter("addr2");
	String addr3 = req.getParameter("addr3");
	
	user.setUserLocal(addr2 + " " + addr3);
	System.out.println(user);
	
	//1.비지니스로직 실행
	int result = userService.updateUser(user);
	
	//2.처리결과에 따라 view단 분기처리
	String msg = "";
	if(result>0){ 
		msg="회원정보수정성공!";
		User updatedUser = userService.selectOneUser(user.getUserId());
		mav.addObject("loginUser", updatedUser);
	}
	else 
		msg="회원정보수정실패!";
	
	//리다이렉트시 값전달하기
	FlashMap flashMap = RequestContextUtils.getOutputFlashMap(req);
	flashMap.put("msg", msg);
	
	return mav;
	}

		

	// 회원 탈퇴 get
	@RequestMapping(value="/userDelete", method = RequestMethod.GET)
	public String userDelete() {
		return "user/userDelete";
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value="/userDelete", method = RequestMethod.POST)
	public String userDelete(User user, HttpSession session, RedirectAttributes rttr, SessionStatus sessionStatus) {
		//세션에 있는 user를 가져와 userDelete변수에 넣어준다. 
		User u = (User) session.getAttribute("user");
		
		// 세션에있는 비밀번호
		String sessionPass = user.getUserPwd();
		// vo로 들어오는 비밀번호
		String voPass = bcryptPasswordEncoder.encode(user.getUserPwd());

		if(!(bcryptPasswordEncoder.matches(sessionPass, voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/userDelete";
		}
		int result = userService.userDelete(user);
		if(result == 0) {
			rttr.addFlashAttribute("msg", "회원탈퇴 실패");
		}
		userLogout(sessionStatus);
		return "redirect:/";
	}
	

	@GetMapping("/checkIdDuplicate1.do")
	public ModelAndView checkIdDuplicate1(ModelAndView mav,
										  @RequestParam("userId") String userId) {
		
		//1. 업무로직 : 중복체크
		User user = userService.selectOneUser(userId);
		boolean isUsable = user == null;
		
		//2. model에 속성등록
		mav.addObject("isUsable", isUsable);
		
		//3. viewName : jsonView빈 지정
		mav.setViewName("jsonView");// /WEB-INF/views/jsonView.jsp
		
		return mav;
	}
	
	//카카오로그인
	@RequestMapping("/kakaologin.do")
	public String kakaoLognin(@RequestParam("code") String code, HttpSession session, Model model) {
//		log.debug("code = {}", code);
		
		String access_Token = kakao.getAccessToken(code);
//		log.debug("controller access_token = {}", access_Token);
		
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		String kakaoId = (String)userInfo.get("email");

		User u = userService.selectOneUser(kakaoId);
		
		//DB에 등록 안되어있으면 회원가입페이지로 -> 추가정보입력
		if(u == null) {
			model.addAttribute("userId", kakaoId);
			return "user/signup";
		}
		
		session.setAttribute("loginUser", u);
		session.setAttribute("access_Token", access_Token);
		//세션에서 next값 가져오기
		String next = (String)session.getAttribute("next");
		String location = next != null ? next : "/";
		return "redirect:/"+location;
	}

	@GetMapping("/checkIdDuplicate2.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate2(@RequestParam("userId") String userId) {
		User user = userService.selectOneUser(userId);
		boolean isUsable = (user == null);
		
		Map<String, Object> map = new HashMap<>();
		map.put("isUsable", isUsable);
		map.put("userId", userId);
		
		return map;
	}
}
