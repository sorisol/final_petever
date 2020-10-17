package com.kh.petever.shelterAnimalBoard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.petever.shelterAnimalBoard.model.vo.ShelterAnimalBoard;

public interface ShelterAnimalBoardService {

	int insertXml(ShelterAnimalBoard shelterAniBoard);

	List<ShelterAnimalBoard> shelterAniBoardSelect(Map<String, String> param, RowBounds rowBounds);

	int shelterAniBoardCount(Map<String, String> param);

	ShelterAnimalBoard shelterAniDetailSelect(String shelterNo);

}
