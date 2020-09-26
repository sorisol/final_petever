package com.kh.petever.shelterBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	@Override
	public List<ShelterAnimal> selectAll(Map<String, Object> map, RowBounds rowBounds) {
		return sqlSession.selectList("shelterBoard.selectAll", map, rowBounds);
	}

	@Override
	public int shelterAnimalCount(Map<String, Object> map) {
		return sqlSession.selectOne("shelterBoard.shelterAnimalCount", map);
	}

	
}
