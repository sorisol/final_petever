package com.kh.petever.animalboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;

@Repository
public class AnimalBoardDAOImpl implements AnimalBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(AnimalBoard animal) {
		return sqlSession.insert("animalBoard.insertBoard", animal);
	}

	@Override
	public int insertAttachment(AnimalAttach attach) {
		return sqlSession.insert("animalBoard.insertAttachment", attach);
	}

}
