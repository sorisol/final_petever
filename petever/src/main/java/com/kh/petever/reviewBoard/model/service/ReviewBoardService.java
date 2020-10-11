package com.kh.petever.reviewBoard.model.service;

import java.util.List;

import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;


public interface ReviewBoardService {
	
	List<ReviewBoard> selectReviewBoard(int limit, int offset);
	
	int insertReviewBoard(ReviewBoard review);
	
	List<ReviewAttach> selectAttachList();
	
	

}
 