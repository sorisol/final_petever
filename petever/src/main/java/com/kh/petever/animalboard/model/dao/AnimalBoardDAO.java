package com.kh.petever.animalboard.model.dao;

import java.util.List;

import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;

public interface AnimalBoardDAO {

	int insertBoard(AnimalBoard animal);

	int insertAttachment(AnimalAttach attach);

	List<AnimalBoard> selectBoardList(int limit, int offset);

	AnimalBoard selectOneBoard(int no);

}
