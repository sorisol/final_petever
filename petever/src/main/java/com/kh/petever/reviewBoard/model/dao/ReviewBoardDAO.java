package com.kh.petever.reviewBoard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;
import com.kh.petever.reviewBoard.model.vo.ReviewComment;


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
	
	//첨부파일삭제
	int deleteAttach(int rewBoId);
	
	//댓글목록
	List<ReviewComment> selectCommentList(int no);
	
	//댓글 Total
	int totalComment(int no);
	
	//댓글쓰기
	int insertComment(ReviewComment reviewComment);
	
	//댓글삭제
	int deleteComment(int commentNo);
	
	//댓글수정
	int editComment(ReviewComment reviewComment);
	
	//게시글검색 리스트
	List<ReviewBoard> searchBoardList(ReviewBoard reviewBoard);
	
	//첨부파일조회
	List<ReviewAttach> selectAttachListOneBoard(int no);
	
	//페이징
	int reviewBoardCount();
	
}
