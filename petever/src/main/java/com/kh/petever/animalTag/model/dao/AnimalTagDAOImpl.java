package com.kh.petever.animalTag.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnimalTagDAOImpl implements AnimalTagDAO {
	
	@Autowired
	private SqlSession sqlSession;

}
