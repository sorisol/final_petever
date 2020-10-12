package com.kh.petever.shelterInfoBoard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.shelterInfoBoard.model.vo.ShelterInfoBoard;

@Repository
public class ShelterInfoBoardDAOImpl implements ShelterInfoBoardDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ShelterInfoBoard> selectBoardList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset,limit);
		return session.selectList("shelterInfoBoard.selectBoardList", null, rowBounds);
	}

	@Override
	public int selectBoardTotalContents() {
		return session.selectOne("shelterInfoBoard.selectBoardTotalContents");
	}

}
