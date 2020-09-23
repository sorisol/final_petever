package com.kh.petever.animalboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AnimalBoardController {
	
	@GetMapping("/animalboard")
	public String animalboardList() {
		return "animalBoard/mp-board";
	}
	
	@GetMapping("/animalboard/boardView")
	public String animalboardView() {
		return "animalBoard/mp-board-view";
	}
	
	@GetMapping("/animalboard/boardFrm")
	public String animalboardFrm() {
		return "animalBoard/mp-boardFrm";
	}
}
