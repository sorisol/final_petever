package com.kh.petever.reviewBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.reviewBoard.model.vo.ReviewAttach;
import com.kh.petever.reviewBoard.model.vo.ReviewBoard;
import com.kh.petever.reviewBoard.model.vo.ReviewComment;



@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<ReviewBoard> selectReviewBoard(int limit, int offset) {
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("reviewboard.selectReviewBoardList", null, rowBounds);
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

	@Override
	public ReviewBoard selectOneBoard(int no) {
		
		return sqlSession.selectOne("reviewboard.selectOneBoard", no);
	}

	@Override
	public int updateBoard(ReviewBoard reviewBoard) {
		
		return sqlSession.update("reviewboard.updateBoard", reviewBoard);
	}

	@Override
	public int deleteBoard(int no) {
		return sqlSession.delete("reviewboard.deleteBoard", no);
	}

	@Override
	public int deleteAttach(int rewBoId) {	
		return sqlSession.delete("reviewboard.deleteAttach", rewBoId);
	}

	@Override
	public List<ReviewComment> selectCommentList(int no) {
		return sqlSession.selectList("reviewboard.selectCommentList", no);
		
	}

	@Override
	public int totalComment(int no) {
	return sqlSession.selectOne("reviewboard.totalComment", no);
		}

	@Override
	public int insertComment(ReviewComment reviewComment) {

		return sqlSession.insert("reviewboard.insertComment", reviewComment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return sqlSession.delete("reviewboard.deleteComment", commentNo);
	}

	@Override
	public int editComment(ReviewComment reviewComment) {
		return sqlSession.update("reviewboard.editComment", reviewComment);
	}

	@Override
	public List<ReviewBoard> searchBoardList(ReviewBoard reviewBoard) {
		return sqlSession.selectList("reviewboard.searchBoardList", reviewBoard);
	}

	@Override
	public List<ReviewAttach> selectAttachListOneBoard(int no) {
		return sqlSession.selectList("reviewboard.selectAttachListOneBoard", no);
	}

	@Override
	public int reviewBoardCount() {
		return sqlSession.selectOne("reiewboard.reviewBoardCount");
	}

	


	
}
