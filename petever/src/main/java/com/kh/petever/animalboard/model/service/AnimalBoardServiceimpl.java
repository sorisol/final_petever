package com.kh.petever.animalboard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petever.animalboard.model.dao.AnimalBoardDAO;
import com.kh.petever.animalboard.model.vo.AdoptApplication;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.animalboard.model.vo.AnimalComment;
import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AnimalBoardServiceimpl implements AnimalBoardService {

	@Autowired
	private AnimalBoardDAO dao;
	
	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int insertBoard(AnimalBoard animal) {
		int result = 0;
		
		//1.board 테이블에 insert
		result = dao.insertBoard(animal);
		log.debug("result = {}", result);
		if(result == 0)
			throw new RuntimeException("게시글 등록 오류");
		
//		2.attachment 테이블에 insert
		//첨부파일 수 만큼 행추가
		List<AnimalAttach> attachList = animal.getAttachList();
		//첨부파일이 있는 경우
		if(attachList != null) {
			for(AnimalAttach attach : attachList) {
				attach.setAniBoId(animal.getAniBoId());
				log.debug("attach = {}", attach);
				result = dao.insertAttachment(attach);
				
				if(result == 0)
					throw new RuntimeException("첨부파일 등록 오류");
			}
		}
		
		return result;
	}

	@Override
	public List<AnimalBoard> selectBoardList(RowBounds rowBounds) {
		return dao.selectBoardList(rowBounds);
	}

	@Override
	public AnimalBoard selectOneBoard(int no) {
		return dao.selectOneBoard(no);
	}

	@Override
	public List<AnimalAttach> selectAttachList() {
		return dao.selectAttachList();
	}

	@Override
	public List<AnimalComment> selectCommentList(int no) {
		return dao.selectCommentList(no);
	}

	@Override
	public int totalComment(int no) {
		return dao.totalComment(no);
	}

	@Override
	public int insertComment(AnimalComment aniComment) {
		return dao.insertComment(aniComment);
	}

	@Override
	public int deleteBoard(int no) {
		return dao.deleteBoard(no);
	}

	@Override
	public int deleteComment(int commentNo) {
		return dao.deleteComment(commentNo);
	}

	@Override
	public int editComment(AnimalComment aniComment) {
		return dao.editComment(aniComment);
	}

	@Override
	public List<AnimalBoard> searchBoardList(Map<String, Object> param) {
		return dao.searchBoardList(param);
	}
	
	@Override
	public int deleteAttach(int aniBoId) {
		return dao.deleteAttach(aniBoId);
	}

	@Override
	public int updateBoard(AnimalBoard animal) {
		int result = 0;
		
		//1.board 테이블에 update
		result = dao.updateBoard(animal);
		log.debug("result = {}", result);
		if(result == 0)
			throw new RuntimeException("게시글 수정 오류");
		
//		2.attachment 테이블에 update
		//첨부파일 수 만큼 행추가
		List<AnimalAttach> attachList = animal.getAttachList();
		//첨부파일이 있는 경우
		if(attachList != null) {
			for(AnimalAttach attach : attachList) {
				attach.setAniBoId(animal.getAniBoId());
				log.debug("attach = {}", attach);
				result = dao.insertAttachment(attach);
				
				if(result == 0)
					throw new RuntimeException("첨부파일 등록 오류");
			}
		}
		
		return result;
	}

	@Override
	public List<AnimalBoard> selectBoardListOneWeek() {
		return dao.selectBoardListOneWeek();
	}

	@Override
	public int insertApplication(AdoptApplication application) {
		return dao.insertApplication(application);
	}

	@Override
	public List<ShelterAnimal> selectShelterAnimalList(AnimalBoard animalBoard) {
		return dao.selectShelterAnimalList(animalBoard);
	}

	@Override
	public int insertReport(Report rep) {
		return dao.insertReport(rep);
	}

	@Override
	public Report selectOneReport(Map<String, Object> param) {
		return dao.selectOneReport(param);
	}

	@Override
	public int animalBoardCount() {
		return dao.animalBoardCount();
	}

	@Override
	public List<AnimalAttach> selectAttachListOneBoard(int no) {
		return dao.selectAttachListOneBoard(no);
	}

	@Override
	public AdoptApplication selectOneApplication(int no) {
		return dao.selectOneApplication(no);
	}
	
	
}
