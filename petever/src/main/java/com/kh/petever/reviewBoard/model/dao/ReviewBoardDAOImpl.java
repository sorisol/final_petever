package com.kh.petever.reviewBoard.model.dao;

import java.util.List;




import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;



@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<ReviewBoard> selectReviewBoard(int limit, int offset) {
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("reviewboard.selectReviewBoardList");
	}
	
	//게시글작성
	@Override
	public int insertReviewBoard(ReviewBoard reviewBoard) {
		return sqlSession.insert("reviewboard.insertReviewBoard", reviewBoard);
	}
	
	@Override
	public int insertAttachment(ReviewAttach attach) {
		return sqlSession.insert("reviewboard.insertAttachment", attach);
	}

	@Override
	public List<ReviewAttach> selectAttachList() {
		return sqlSession.selectList("reviewboard.selectAttachList");
	}

}
