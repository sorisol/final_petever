package com.kh.petever.animalTag.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping("/animalTagBuy.do")
	public String animalTagBuy(AnimalTag aniTag) {
		System.out.println(aniTag);

		int result = animalService.insertAniTag(aniTag);
		
		return "";
	}
	
	
}
