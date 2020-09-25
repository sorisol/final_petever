package com.kh.petever.animalboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petever.animalboard.model.dao.AnimalBoardDAO;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;

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
//		if(result == 0)
//			throw new Exception("게시글 등록 오류");
		
//		2.attachment 테이블에 insert
		//첨부파일 수 만큼 행추가
		List<AnimalAttach> attachList = animal.getAttachList();
		//첨부파일이 있는 경우
		if(attachList != null) {
			for(AnimalAttach attach : attachList) {
				attach.setAniBoId(animal.getAniBoId());
				log.debug("attach = {}", attach);
				result = dao.insertAttachment(attach);
				
//				if(result == 0)
//					throw new Exception("첨부파일 등록 오류");
			}
		}
		
		return result;
	}

}
