package com.kh.petever.animalTag.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petever.animalTag.model.service.AnimalTagService;
import com.kh.petever.animalTag.model.vo.AnimalTag;
import com.kh.petever.common.Utils;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/animalTag")
@Slf4j
public class AnimalTagController {

	@Autowired
	private AnimalTagService animalService;

	@GetMapping("/animalTag.do")
	public String animalTagForm() {

		return "animalTag/animalTag";
	}

	@PostMapping("/insertAniTag.do") 
	public String animalTagBuy(AnimalTag aniTag, @RequestParam int tagPrice) { 
		log.debug("insert 진입");
		System.out.println(aniTag);
		log.debug("tagPrice{}", tagPrice);
	 
		int result = animalService.insertAniTag(aniTag);
		
		log.debug("등록여부 {}", result == 1 ? "성공" : "실패");
	 
		return "redirect:/"; 
	}
	 

	@PostMapping("/animalTagPay.do")
	public String animalTagPay(AnimalTag aniTag, @RequestParam int tagPrice, Model model) {
		log.debug("cacaoPay 진입");
		System.out.println(aniTag);
		log.debug("tagPrice{}", tagPrice);
		
		model.addAttribute("aniTag", aniTag);
		model.addAttribute("tagPrice", tagPrice);

		return "animalTag/animalTagPay";
	}
	
	@GetMapping("/animalTagList.do")
	public String animalList(@RequestParam String userId, Model model, @RequestParam(defaultValue = "1", value="cPage") int cPage,
							HttpServletRequest request) {
		final int limit = 2;
		int offset = (cPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		log.debug("userId = {}", userId);
		
		List<AnimalTag> list = animalService.selectList(userId, rowBounds);
		System.out.println(list);
		
		String url = request.getRequestURI() + "?userId="+ userId+"&";
		int totalContents = animalService.animalTagCount(userId);
		String pageBar = Utils.getPageBarHtml(cPage, 2, totalContents, url);
		
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("list", list);
		
		return "animalTag/animalTagList";
	}

}
