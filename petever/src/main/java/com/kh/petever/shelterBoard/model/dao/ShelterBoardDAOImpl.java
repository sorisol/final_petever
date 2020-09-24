package com.kh.petever.shelterBoard.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

@Repository
public class ShelterBoardDAOImpl implements ShelterBoardDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertShelterAnimal(ShelterAnimal sa) {
		return sqlSession.insert("shelterBoard.insertShelterAnimal", sa);
	}
	
}
