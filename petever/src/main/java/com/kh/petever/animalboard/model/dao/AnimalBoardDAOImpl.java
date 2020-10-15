package com.kh.petever.animalboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.animalboard.model.vo.AdoptApplication;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.animalboard.model.vo.AnimalComment;
import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

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

	@Override
	public List<AnimalBoard> selectBoardList(RowBounds rowBounds) {
		return sqlSession.selectList("animalBoard.selectBoardList", null, rowBounds);
	}

	@Override
	public AnimalBoard selectOneBoard(int no) {
		return sqlSession.selectOne("animalBoard.selectOneBoard", no);
	}

	@Override
	public List<AnimalAttach> selectAttachList() {
		return sqlSession.selectList("animalBoard.selectAttachList");
	}

	@Override
	public List<AnimalComment> selectCommentList(int no) {
		return sqlSession.selectList("animalBoard.selectCommentList", no);
	}
	
	@Override
	public int totalComment(int no) {
		return sqlSession.selectOne("animalBoard.totalComment", no);
	}

	@Override
	public int insertComment(AnimalComment aniComment) {
		return sqlSession.insert("animalBoard.insertComment", aniComment);
	}

	@Override
	public int deleteBoard(int no) {
		return sqlSession.delete("animalBoard.deleteBoard", no);
	}

	@Override
	public int deleteComment(int commentNo) {
		return sqlSession.delete("animalBoard.deleteComment", commentNo);
	}

	@Override
	public int editComment(AnimalComment aniComment) {
		return sqlSession.update("animalBoard.editComment", aniComment);
	}

	@Override
	public List<AnimalBoard> searchBoardList(Map<String, Object> param) {
		return sqlSession.selectList("animalBoard.searchBoardList", param);
	}

	@Override
	public int deleteAttach(int aniBoId) {
		return sqlSession.delete("animalBoard.deleteAttach", aniBoId);
	}

	@Override
	public int updateBoard(AnimalBoard animal) {
		return sqlSession.update("animalBoard.updateBoard", animal);
	}

	@Override
	public List<AnimalBoard> selectBoardListOneWeek() {
		return sqlSession.selectList("animalBoard.selectBoardListOneWeek");
	}

	@Override
	public int insertApplication(AdoptApplication application) {
		return sqlSession.insert("animalBoard.insertApplication", application);
	}

	@Override
	public List<ShelterAnimal> selectShelterAnimalList(AnimalBoard animalBoard) {
		return sqlSession.selectList("animalBoard.selectShelterAnimalList", animalBoard);
	}

	@Override
	public int insertReport(Report rep) {
		return sqlSession.insert("animalBoard.insertReport", rep);
	}

	@Override
	public Report selectOneReport(Map<String, Object> param) {
		return sqlSession.selectOne("animalBoard.selectOneReport", param);
	}

	@Override
	public int animalBoardCount() {
		return sqlSession.selectOne("animalBoard.animalBoardCount");
	}

	@Override
	public List<AnimalAttach> selectAttachListOneBoard(int no) {
		return sqlSession.selectList("animalBoard.selectAttachListOneBoard", no);
	}

	@Override
	public AdoptApplication selectOneApplication(int no) {
		return sqlSession.selectOne("animalBoard.selectOneApplication", no);
	}
	
}
