package com.kh.petever.check.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.check.model.vo.AnimalView;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CheckDaoImpl implements CheckDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public AnimalView selectOne(String dog) {
		return session.selectOne("check.selectOne",dog);
	}

}
