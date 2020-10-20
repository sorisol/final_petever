package com.kh.petever.user.controller;

import java.io.IOException;
import java.io.Reader;
import java.net.URL;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.io.Resources;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.petever.user.model.service.UserService;
import com.kh.petever.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class userPwdController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/user/findPwdFrm.do")
	public String findPwdFrm() {
		return "/user/find-pwd";
	}

	@PostMapping("/user/selectSearchPwd.do")
	@ResponseBody
	public User selectSearchPwd (User user, HttpServletRequest request) {
		log.debug("selectSearchPwd{}", user);
		
		User userOne = userService.selectSearchPwd(user);
		
		int sigNoResult = 0;
		if(userOne != null) {
			String sigNo = randomSigNo();
			log.debug("난수{}", sigNo);
			userOne.setSigNo(sigNo);
			sigNoResult = userService.updateSigNo(userOne);
		}
		
		
		
		if(userOne != null && sigNoResult > 0) {
			//properties 파일 가져오기
//			URL sqlScriptUrl = userPwdController.class.getClassLoader().getResource("/emaildatasource.properties");

			String fileName = "/emaildatasource.properties"; 
			Properties properties = new Properties();
			
//			log.debug("경로 {}", sqlScriptUrl);
			
			try {
				Reader reader = Resources.getResourceAsReader(fileName);
				properties.load(reader);
				
//				log.debug("emaildatasource.host{}", properties.getProperty("emaildatasource.host"));
//				log.debug("emaildatasource.port{}", properties.getProperty("emaildatasource.port"));
//				log.debug("emaildatasource.username{}", properties.getProperty("emaildatasource.username"));
//				log.debug("emaildatasource.password{}", properties.getProperty("emaildatasource.password"));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			String host = properties.getProperty("emaildatasource.host"); 
			final String username = properties.getProperty("emaildatasource.username"); //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요. 
			final String password = properties.getProperty("emaildatasource.password"); //네이버 이메일 비밀번호를 입력해주세요. 
			int port=465; //포트번호

			// 메일 내용 
			String recipient = user.getUserEmail(); //받는 사람의 메일주소를 입력해주세요. 
			String subject = "[petever] 비밀번호 찾기입니다."; //메일 제목 입력해주세요. 
			String body = "<HTML>"
					+ "<body style='font-size: 13px; margin-left: 90px;'>"
					+ "<script src='${ pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js'></script>"
					+ userOne.getUserId() + "님 안녕하세요??" //메일 내용 입력해주세요. 
					+ "<br>"
					+ "PassWord 잃어버리지 마세요 ㅠ"
					+ "<br>"
					+ "<a href='http://localhost:9090/petever/user/mailPwdFrm.do?userId="+userOne.getUserId()+"&sigNo=" + userOne.getSigNo() + "'>"
					+ "<img src='http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg' alt='' style='width: 250px;'"
					+ "onclick='pageMove();'/>"
					+ "</a>"
					+ "<form id='pwdChange' action='http://localhost:9090/petever/user/mailPwdFrm.do' method='Post'>"
					+ "<input type='hidden' name='userId' value='" + userOne.getUserId() + "' />"
					+ "<input type='hidden' name='sigNo' value='" + userOne.getSigNo() + "' />"
					+ ""
					+ "<input type='submit' value='홈페이지 이동' style='padding: 5px; width: 110px; height: 35px; border-radius: 10px;" 
					+ "border: 1px solid darkgray; background-color: beige; font-weight: bold; font-size: 11px; margin-left: 60px;'/>"
					+ "</form>"
					+ "<script>"
					+ "$(function() {"
					+ "	function pageMove(){"
					+ "		console.log(111);"
					+ "		$('#pwdChange').submit();"
					+ "	}"
					+ "})"
					+ "</script>"
					+ "</body>"
					+ "</HTML>"; 
			Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 
			
			// SMTP 서버 정보 설정 
			props.put("mail.smtp.host", host); 
			props.put("mail.smtp.port", port); 
			props.put("mail.smtp.auth", "true"); 
			props.put("mail.smtp.ssl.enable", "true"); 
			props.put("mail.smtp.ssl.trust", host);

			//Session 생성 
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
				String un=username; 
				String pw=password; 
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
					return new javax.mail.PasswordAuthentication(un, pw); 
				} 
			}); 
			session.setDebug(true); //for debug 
			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
			try {
				mimeMessage.setFrom(new InternetAddress("pts1989@naver.com"));
				//발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
				//수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
				
				mimeMessage.setSubject(subject); //제목셋팅 
//				mimeMessage.setText(body); //내용셋팅 
				mimeMessage.setContent(body, "text/html; charset=euc-kr");
				Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
			} catch (MessagingException e) {
				e.printStackTrace();
			} 

			
		}
		return userOne;
	}
	
	@PostMapping("/user/mailPwdFrm.do")
	public String mailPwdFrm(@RequestParam String userId, @RequestParam String sigNo, Model model, RedirectAttributes redirectAttr) {
		log.debug("userId {}, sigNo {}", userId, sigNo);
		
		User user = userService.selectOneUser(userId);
		
		String msg = "";
		String location = "";
		if(user != null && user.getSigNo().equals(sigNo)) {
			System.out.println("111");
			model.addAttribute("userId", userId);
			model.addAttribute("sigNo", sigNo);
			location = "/user/userPwdChange";
		} else {
			System.out.println("222");
//			msg = "ID 혹은 최신 key값이 아닙니다. ^^\n 다시 진행해주세요";
//			redirectAttr.addFlashAttribute("msg", msg);
			location = "/user/mailPwdFrmFail";
		}
		
		return location;
	}
	
	@PostMapping("/user/mailPwdChange.do")
	public String mailPwdChange(User user, @RequestParam String sigNo, Model model, RedirectAttributes redirectAttr) {
		log.debug("user{}, sigNo {}", user, sigNo);
		
		User userOk = userService.selectOneUser(user.getUserId());
		log.debug("user = {}", userOk);
		
		int result = 0;
		String location = "";
		String msg = "";
		if(userOk != null && userOk.getSigNo().equals(sigNo)) {
			String rawPassword = user.getUserPwd();
			String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
			userOk.setUserPwd(encryptPassword);
			
			result = userService.updateUserPwd(userOk);
			
			msg = (result > 0) ? "PASSWORD 수정 성공" : "PASSWORD 수정 실패";
		} else {
			msg = "ID 혹은 최신 key값이 아닙니다.";
		}
		
		redirectAttr.addFlashAttribute("msg", msg);
		
		location = (result > 0) ? "/user/login" : "redirect:/";
		return location;
	}
	
	public String randomSigNo() {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 20; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		return temp.toString();
	}
	
	
	
}
