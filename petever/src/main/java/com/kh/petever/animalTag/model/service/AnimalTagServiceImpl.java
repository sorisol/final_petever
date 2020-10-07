package com.kh.petever.animalTag.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.animalTag.model.dao.AnimalTagDAO;
import com.kh.petever.animalTag.model.vo.AnimalTag;

@Service
public class AnimalTagServiceImpl implements AnimalTagService {
	
	@Autowired
	private AnimalTagDAO animalTagDAO;

	@Override
	public int insertAniTag(AnimalTag aniTag) {
		return animalTagDAO.insertAniTag(aniTag);
	}

}
