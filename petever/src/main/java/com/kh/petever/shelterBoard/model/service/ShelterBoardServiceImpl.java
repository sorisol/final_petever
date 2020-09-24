package com.kh.petever.shelterBoard.model.service;

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
	
	
	
}
