package com.kh.petever.shelterAnimalBoard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.shelterAnimalBoard.model.dao.ShelterAnimalBoardDAO;
import com.kh.petever.shelterAnimalBoard.model.vo.ShelterAnimalBoard;

@Service
public class ShelterAnimalBoardServiceImpl implements ShelterAnimalBoardService {
	
	@Autowired
	private ShelterAnimalBoardDAO shelterAnimalBoardDAO;

	@Override
	public int insertXml(ShelterAnimalBoard shelterAniBoard) {
		return shelterAnimalBoardDAO.insertXml(shelterAniBoard);
	}

	@Override
	public List<ShelterAnimalBoard> shelterAniBoardSelect(Map<String, String> param, RowBounds rowBounds) {
		return shelterAnimalBoardDAO.shelterAniBoardSelect(param, rowBounds);
	}

	@Override
	public int shelterAniBoardCount(Map<String, String> param) {
		return shelterAnimalBoardDAO.shelterAniBoardCount(param);
	}

	@Override
	public ShelterAnimalBoard shelterAniDetailSelect(String shelterNo) {
		return shelterAnimalBoardDAO.shelterAniDetailSelect(shelterNo);
	}
	
	

}
