package com.kh.petever.check.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.check.model.dao.CheckDao;
import com.kh.petever.check.model.vo.AnimalView;

@Service
public class CheckServiceImpl implements CheckService {

	@Autowired
	private CheckDao CheckDao;

	@Override
	public AnimalView selectOne(String dog) {
		return CheckDao.selectOne(dog);
	}

}
