package com.kh.petever.animalTag.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.petever.animalTag.model.service.AnimalTagService;

@Controller
@RequestMapping("/animalTag")
public class AnimalTagController {
	
	@Autowired
	private AnimalTagService animalService;

	@GetMapping("/animalTag.do")
	public String animalTagForm() {
		
		return "animalTag/animalTag";
	}
	
	
}
