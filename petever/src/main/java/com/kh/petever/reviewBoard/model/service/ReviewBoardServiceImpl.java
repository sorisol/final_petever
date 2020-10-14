package com.kh.petever.reviewBoard.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.reviewBoard.model.dao.ReviewBoardDAO;
import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;

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
		
//		2.attachment 테이블에 insert
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

}
