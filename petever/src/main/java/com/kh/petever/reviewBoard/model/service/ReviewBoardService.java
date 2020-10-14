package com.kh.petever.reviewBoard.model.service;

import java.util.List;

import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;


public interface ReviewBoardService {
	
	List<ReviewBoard> selectReviewBoard(int limit, int offset);
	
	int insertReviewBoard(ReviewBoard reviewBoard);
	
	List<ReviewAttach> selectAttachList();
	
	ReviewBoard selectOneBoard(int no);
	
	int updateBoard(ReviewBoard reviewBoard);
	
	int deleteBoard(int no);
	
	int deleteAttach(int rewBoId);
	

}
 