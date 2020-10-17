package com.kh.petever.reviewBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.reviewBoard.model.dao.ReviewBoardDAO;
import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;
import com.kh.petever.reviewBoard.model.vo.ReviewComment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Autowired
	private ReviewBoardDAO reviewBoardDAO;

	@Override
	public List<ReviewBoard> selectReviewBoard(int limit, int offset) {
		// TODO Auto-generated method stub
		return reviewBoardDAO.selectReviewBoard(limit, offset);
	}

	@Override
	public int insertReviewBoard(ReviewBoard reviewBoard) {
		//리턴할 result변수 선언
		int result = 0;
		
		//1.board 테이블에 insert
		result = reviewBoardDAO.insertReviewBoard(reviewBoard);
		log.debug("result = {}", result);
		if(result == 0)
			throw new RuntimeException("게시글 등록 오류");
		
		//2.attachment 테이블에 insert
		//첨부파일 수 만큼 행추가
		List<ReviewAttach> attachList = reviewBoard.getAttachList();
		//첨부파일이 있는 경우
		if(attachList != null) {
			for(ReviewAttach attach : attachList) {
				attach.setRewBoId(reviewBoard.getRewBoId());
				log.debug("attach = {}", attach);
				result = reviewBoardDAO.insertAttachment(attach);
				
				if(result == 0)
					throw new RuntimeException("첨부파일 등록 오류");
			}
		}
		
		return result;
	}

	@Override
	public List<ReviewAttach> selectAttachList() {
		return reviewBoardDAO.selectAttachList();
	}


	@Override
	public ReviewBoard selectOneBoard(int no) {
		return reviewBoardDAO.selectOneBoard(no);
	}

	@Override
	public int updateBoard(ReviewBoard reviewBoard) {
		return reviewBoardDAO.updateBoard(reviewBoard);
	}

	@Override
	public int deleteBoard(int no) {
		return reviewBoardDAO.deleteBoard(no);
	}

	@Override
	public int deleteAttach(int rewBoId) {
		return reviewBoardDAO.deleteAttach(rewBoId);
	}

	@Override
	public List<ReviewComment> selectCommentList(int no) {
		return reviewBoardDAO.selectCommentList(no);
	}

	@Override
	public int totalComment(int no) {
		return reviewBoardDAO.totalComment(no);
	}

	@Override
	public int insertComment(ReviewComment reviewComment) {
		return reviewBoardDAO.insertComment(reviewComment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return reviewBoardDAO.deleteComment(commentNo);
	}

	@Override
	public int editComment(ReviewComment reviewComment) {
		return reviewBoardDAO.editComment(reviewComment);
	}

	@Override
	public List<ReviewBoard> searchBoardList(ReviewBoard reviewBoard) {
		return reviewBoardDAO.searchBoardList(reviewBoard);
	}

	@Override
	public List<ReviewAttach> selectAttachListOneBoard(int no) {
		return reviewBoardDAO.selectAttachListOneBoard(no);
	}

	@Override
	public int reviewBoardCount() {
		return reviewBoardDAO.reviewBoardCount();
	}

	@Override
	public int insertReport(Report rep) {
		return reviewBoardDAO.insertReport(rep);
	}

	@Override
	public Report selectOneReport(Map<String, Object> param) {
		return reviewBoardDAO.selectOneReport(param);
	}

	@Override
	public int selectBoardTotalContents() {
		return reviewBoardDAO.selectBoardTotalContents();
	}

	@Override
	public List<ReviewBoard> selectBoardListOneWeek() {
		return reviewBoardDAO.selectBoardListOneWeek();
	}

}
