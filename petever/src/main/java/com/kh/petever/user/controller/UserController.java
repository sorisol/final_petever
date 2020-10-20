package com.kh.petever.user.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import org.springframework.web.util.UrlPathHelper;

import com.kh.petever.user.model.service.KakaoAPI;
import com.kh.petever.user.model.service.UserService;
import com.kh.petever.user.model.vo.User;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


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
	@RequestMapping(value ="/signup.do", method = RequestMethod.POST)
	public String userSignup(User user, HttpServletRequest req, RedirectAttributes redirectAttr) {
		log.debug("user@controller = {}", user);
		
		String rawPassword = user.getUserPwd();
		//카카오아이디로 회원가입 했을 경우
		if(user.getUserPwd() == null) {
			rawPassword = "petever";
		}
		
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		user.setUserPwd(encryptPassword);
		log.debug("rawPassword = {}", rawPassword);
		log.debug("encryptPassword = {}", encryptPassword);
		
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
	public String login(HttpServletRequest request, HttpSession session) {
		String referer = request.getHeader("referer"); //로그인을 요청한 페이지
//		log.debug("{}", referer);
		String next = referer.replaceAll("http://localhost:9090/petever/", "");
//		log.debug("{}", next);
		session.setAttribute("next", next);
		
		return "user/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String userLogin(@RequestParam String userId, @RequestParam String userPwd, Model model,RedirectAttributes redirectAttr, 
		HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {

		log.debug("userId = {}, userPwd = {}", userId, userPwd);

		//userId로 회원정보 조회하기 
		User user = userService.selectOneUser(userId);
		log.debug("user = {}", user);

		String location = "/";
		String saveId = request.getParameter("saveId");

		// 로그인 성공
		if (user != null && bcryptPasswordEncoder.matches(userPwd, user.getUserPwd())) {

			//세션처리
			model.addAttribute("loginUser", user);
			
			//세션에 next값 가져오기 
			String next = (String)session.getAttribute("next");
			location = next != null ? next : location;
			session.removeAttribute("next");
			
			//세션 유효시간설정
			session.setMaxInactiveInterval(30*60);
			
			//세션에 로그인한 사용자 정보 저장
			session.setAttribute("loginUser", user);
			
			//쿠키(SaveId) 처리 
			Cookie c = new Cookie("saveId", userId);
			c.setPath(request.getContextPath());
			
			log.debug("saveId = {}", saveId);
			
			//SaveId 체크한 경우 : 쿠키 생성
			if(saveId != null) {
				c.setMaxAge(7*24*60*60); //7일
				
			}
			else {
				c.setMaxAge(0); //브라우저에서 즉시 삭제하기
			}
			response.addCookie(c);
			
			//리다이렉트처리
			//response.sendRedirect(request.getContextPath());
//			String uri = request.getRequestURI(); // /spring/board/boardForm.do
//			uri = uri.replace(request.getContextPath(), "");
			redirectAttr.addFlashAttribute("msg", "로그인 성공.");
			return "redirect:/"+location;
			
		} 
		//신고된 사용자
		else if(user != null && !user.getUserRole().equals("R")) {
			redirectAttr.addFlashAttribute("msg", "귀하는 신고로 인해 사이트 이용이 중지되었습니다. 고객센터로 연락해주세요.");
			return "redirect:/user/login.do";
		}
		// 로그인 실패
		else {
			log.debug("1111");
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "redirect:/user/login.do";
		}
	}
	

	// 로그아웃 - 세션 무효화

	@RequestMapping("/logout.do")
	public String userLogout(SessionStatus sessionStatus, HttpSession session) {
		Enumeration se = session.getAttributeNames();

		while(se.hasMoreElements()){
			String getse = se.nextElement()+"";
			log.debug("@@@@@@@ session1 : "+getse+" : "+session.getAttribute(getse));
		}
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		
		// @SessionAttribute를 통해 등록된 객체 무효화
		if (sessionStatus.isComplete() == false)
			sessionStatus.setComplete();

		while(se.hasMoreElements()){
			String getse = se.nextElement()+"";
			log.debug("@@@@@@@ session2 : "+getse+" : "+session.getAttribute(getse));
		}
		
		return "redirect:/";

	}

	// 회원정보보기, 수정
	@RequestMapping("/userDetail.do")
	public String userDetail(Principal principal, Model model) {
		log.debug("principal = {}", principal);
		model.addAttribute("loginUser", principal);
		
		return "user/userDetail";
	}

	@RequestMapping(value = "/userUpdate.do", method = RequestMethod.POST)
	public ModelAndView userUpdate(User user, HttpServletRequest req){
	//파라미터로 전달받지 않고 직접 객체 생성 또한 가능
	//viewName 생성자에 전달 가능
	ModelAndView mav = new ModelAndView("redirect:/user/userDetail.do");
	log.debug("user = {}", user);
	
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
		userLogout(sessionStatus, session);
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
	
	@GetMapping("/findIdFrm.do")
	public String findIdFrm() {
		return "/user/find-id";
	}
	
	@RequestMapping("/sendMsg.do")
	public @ResponseBody Map<String, Object> sendMsg(User user){
	    String api_key = "NCSWW8V5EVEGRD4R";
	    String api_secret = "ZCHDRIEFOUT4HEZQQCXE1SBDSQYLYOTD";
	    Message coolsms = new Message(api_key, api_secret);
	    int rndCode = (int)(Math.floor(Math.random() * 1000000)+100000);
        if(rndCode>1000000){
           rndCode = rndCode - 100000;
        }
	    log.debug("{}", user);
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<>();
	    params.put("to", user.getUserPhone());	// 수신전화번호
	    params.put("from", "01041148802");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", String.valueOf(rndCode));
	    params.put("app_version", "test app 1.2"); // application name and version

	    HashMap<String, Object> result = new HashMap<>();
	    String msg = "인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.";
//	    try {
//	      JSONObject obj = (JSONObject) coolsms.send(params);
//	      log.debug("{}", obj.toString());
//	    } catch (CoolsmsException e) {
//	      log.error("문자 발송 오류", e.getMessage());
//	      log.error("문자 발송 오류",e.getCode());
//	      msg = "인증번호 전송에 실패하였습니다.";
//	    }
	    result.put("msg", msg);
	    result.put("verificationCode", rndCode);
	    
	    return result;
	}
	
	@RequestMapping("/selectOneUser.do")
	@ResponseBody
	public List<User> selectOneUser(User user) {
		List<User> list = userService.selectUserList(user.getUserPhone());
		return list;
	}
	
	
}
