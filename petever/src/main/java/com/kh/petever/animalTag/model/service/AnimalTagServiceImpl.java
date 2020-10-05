package com.kh.petever.animalTag.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.animalTag.model.dao.AnimalTagDAO;

@Service
public class AnimalTagServiceImpl implements AnimalTagService {
	
	@Autowired
	private AnimalTagDAO animalTagDAO;

}
