package com.kh.petever.check.model.dao;

import com.kh.petever.check.model.vo.AnimalView;

public interface CheckDao {

	AnimalView selectOne(String dog);



}
