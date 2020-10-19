package com.kh.petever.reviewBoard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;
import com.kh.petever.reviewBoard.model.vo.ReviewComment;


public interface ReviewBoardService {
	
	List<ReviewBoard> selectReviewBoard(int limit, int offset);
	
	int insertReviewBoard(ReviewBoard reviewBoard);
	
	List<ReviewAttach> selectAttachList();
	
	ReviewBoard selectOneBoard(int no);
	
	int updateBoard(ReviewBoard reviewBoard);
	
	int deleteBoard(int no);
	
	int deleteAttach(int rewBoId);
	
	List<ReviewComment> selectCommentList(int no);
	
	int totalComment(int no);
	
	int selectBoardTotalContents();
	
	int insertComment(ReviewComment reviewComment);
	
	int deleteComment(int commentNo);
	
	int editComment(ReviewComment reviewComment);
	
	List<ReviewBoard> searchBoardList(ReviewBoard reviewBoard);
	
	List<ReviewAttach> selectAttachListOneBoard(int no);
	
	int reviewBoardCount();
	
	int insertReport(Report rep);

	Report selectOneReport(Map<String, Object> param);	
	
	List<ReviewBoard> selectBoardListOneWeek();
	
}
 