package com.kh.petever.reviewBoard.model.dao;

import java.util.List;

import com.kh.petever.reviewBoard.model.vo.ReviewBoard;



public interface ReviewBoardDAO {
	
	List<ReviewBoard> selectReviewBoard(int limit, int offset);


}
