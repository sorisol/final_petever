package com.kh.petever.reviewBoard.model.dao;

import java.util.List;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.reviewBoard.model.vo.ReviewBoard;



@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<ReviewBoard> selectReviewBoard(int limit, int offset) {
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("reviewboard.selectReviewBoard", null, rowBounds);
	}

}
