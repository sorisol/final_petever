package com.kh.petever.animalboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;
import com.kh.petever.animalboard.model.vo.AnimalComment;

public interface AnimalBoardService {

	int insertBoard(AnimalBoard animal);

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

}
