package com.kh.petever.shelterAnimalBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.shelterAnimalBoard.model.vo.ShelterAnimalBoard;

@Repository
public class ShelterAnimalBoardDAOImpl implements ShelterAnimalBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertXml(ShelterAnimalBoard shelterAniBoard) {
		return sqlSession.insert("ShelterAnimalBoard.insertXml", shelterAniBoard);
	}

	@Override
	public List<ShelterAnimalBoard> shelterAniBoardSelect(Map<String, String> param, RowBounds rowBounds) {
		return sqlSession.selectList("ShelterAnimalBoard.shelterAniBoardSelect", param, rowBounds);
	}

	@Override
	public int shelterAniBoardCount(Map<String, String> param) {
		return sqlSession.selectOne("ShelterAnimalBoard.shelterAniBoardCount", param);
	}

	@Override
	public ShelterAnimalBoard shelterAniDetailSelect(String shelterNo) {
		return sqlSession.selectOne("ShelterAnimalBoard.shelterAniDetailSelect", shelterNo);
	}
	
	
	
}
