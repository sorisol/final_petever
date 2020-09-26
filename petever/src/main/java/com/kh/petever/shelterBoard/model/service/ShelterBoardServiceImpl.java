package com.kh.petever.shelterBoard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.shelterBoard.model.dao.ShelterBoardDAO;
import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

@Service
public class ShelterBoardServiceImpl implements ShelterBoardService{

	@Autowired
	private ShelterBoardDAO shelterBoardDAO;

	@Override
	public int insertShelterAnimal(ShelterAnimal sa) {
		return shelterBoardDAO.insertShelterAnimal(sa);
	}
	
	@Override
	public List<ShelterAnimal> selectAll(Map<String, Object> map, RowBounds rowBounds) {
		return shelterBoardDAO.selectAll(map, rowBounds);
	}

	@Override
	public int shelterAnimalCount() {
		return shelterBoardDAO.shelterAnimalCount();
	}

	
	
	
}
