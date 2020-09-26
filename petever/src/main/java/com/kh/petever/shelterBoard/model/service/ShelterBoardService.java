package com.kh.petever.shelterBoard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

public interface ShelterBoardService {

	int insertShelterAnimal(ShelterAnimal sa);

	List<ShelterAnimal> selectAll(Map<String, Object> map, RowBounds rowBounds);

	int shelterAnimalCount(Map<String, Object> map);

}
