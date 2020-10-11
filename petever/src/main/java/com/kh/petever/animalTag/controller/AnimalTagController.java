package com.kh.petever.animalTag.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.petever.animalTag.model.service.AnimalTagService;
import com.kh.petever.animalTag.model.vo.AnimalTag;

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
	 
		return "/"; 
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

}
