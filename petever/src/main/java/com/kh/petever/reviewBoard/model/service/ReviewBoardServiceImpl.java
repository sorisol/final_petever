package com.kh.petever.reviewBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petever.reviewBoard.model.dao.ReviewBoardDAO;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;

public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Autowired
	private ReviewBoardDAO reviewBoardDAO;

	@Override
	public List<ReviewBoard> selectReviewBoard(int limit, int offset) {
		// TODO Auto-generated method stub
		return reviewBoardDAO.selectReviewBoard(limit, offset);
	}

}
