package com.kh.petever.animalboard.model.service;

import java.util.List;

import com.kh.petever.animalboard.model.vo.AnimalBoard;

public interface AnimalBoardService {

	int insertBoard(AnimalBoard animal);

	List<AnimalBoard> selectBoardList(int limit, int offset);

	AnimalBoard selectOneBoard(int no);

}
