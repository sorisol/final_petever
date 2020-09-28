package com.kh.petever.reviewBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petever.reviewBoard.model.dao.ReviewBoardDAO;

public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Autowired
	private ReviewBoardDAO reviewBoardDAO;

}
