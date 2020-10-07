package com.kh.petever.reviewBoard.model.dao;

import java.util.List;

import com.kh.petever.reviewBoard.model.vo.ReviewBoard;



public interface ReviewBoardDAO {
	
	//게시글목록조회 
	List<ReviewBoard> selectReviewBoard(int limit, int offset);


}
