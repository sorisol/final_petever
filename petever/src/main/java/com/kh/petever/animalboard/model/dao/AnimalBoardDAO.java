package com.kh.petever.animalboard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.petever.animalboard.model.vo.AdoptApplication;
import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.animalboard.model.vo.AnimalComment;
import com.kh.petever.animalboard.model.vo.Report;
import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

public interface AnimalBoardDAO {

	int insertBoard(AnimalBoard animal);

	int insertAttachment(AnimalAttach attach);

	List<AnimalBoard> selectBoardList(int limit, int offset);

	AnimalBoard selectOneBoard(int no);

	List<AnimalAttach> selectAttachList();

	List<AnimalComment> selectCommentList(int no);

	int totalComment(int no);

	int insertComment(AnimalComment aniComment);

	int deleteBoard(int no);

	int deleteComment(int commentNo);

	int editComment(AnimalComment aniComment);

	List<AnimalBoard> searchBoardList(AnimalBoard animal);

	int deleteAttach(int aniBoId);

	int updateBoard(AnimalBoard animal);

	List<AnimalBoard> selectBoardListOneWeek();

	int insertApplication(AdoptApplication application);

	List<ShelterAnimal> selectShelterAnimalList(AnimalBoard animalBoard);

	int insertReport(Report rep);

}
