package com.kh.petever.animalboard.model.dao;

import com.kh.petever.animalboard.model.vo.AnimalAttach;
import com.kh.petever.animalboard.model.vo.AnimalBoard;

public interface AnimalBoardDAO {

	int insertBoard(AnimalBoard animal);

	int insertAttachment(AnimalAttach attach);

}
