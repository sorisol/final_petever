package com.kh.petever.reviewBoard.model.dao;

import java.util.List;

import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;


public interface ReviewBoardDAO {
	
	//게시글 목록조회 
	List<ReviewBoard> selectReviewBoard(int limit, int offset);

	//게시글 작성
	int insertReviewBoard(ReviewBoard reviewBoard);
	
	//첨부파일
	int insertAttachment(ReviewAttach attach);

	List<ReviewAttach> selectAttachList();
	
	//게시글 조회
	ReviewBoard selectOneBoard(int no);

	//게시글 수정
	int updateBoard(ReviewBoard reviewBoard);
	
	//게시글 삭제
	int deleteBoard(int no);
	
	int deleteAttach(int rewBoId);
	
	
	
}
