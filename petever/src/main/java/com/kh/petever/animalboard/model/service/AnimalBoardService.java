package com.kh.petever.animalboard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.animalboard.model.vo.AdoptApplication;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.animalboard.model.vo.AnimalComment;
import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

public interface AnimalBoardService {

	int insertBoard(AnimalBoard animal);

	List<AnimalBoard> selectBoardList(RowBounds rowBounds);

	AnimalBoard selectOneBoard(int no);

	List<AnimalAttach> selectAttachList();

	List<AnimalComment> selectCommentList(int no);

	int totalComment(int no);

	int insertComment(AnimalComment aniComment);

	int deleteBoard(int no);

	int deleteComment(int commentNo);

	int editComment(AnimalComment aniComment);

	List<AnimalBoard> searchBoardList(Map<String, Object> param);

	int deleteAttach(int aniBoId);

	int updateBoard(AnimalBoard animal);

	List<AnimalBoard> selectBoardListOneWeek();

	int insertApplication(AdoptApplication application);

	List<ShelterAnimal> selectShelterAnimalList(AnimalBoard animalBoard);

	int insertReport(Report rep);

	Report selectOneReport(Map<String, Object> param);

	int animalBoardCount();

	List<AnimalAttach> selectAttachListOneBoard(int no);

	AdoptApplication selectOneApplication(int no);

}
