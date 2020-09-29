package com.kh.petever.statis.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.vo.StatisList;

public interface StatisDao {


	int insertXml(ShelterAnimal statis);

	int adoptStatis(List<String> areaArr);

	int euthanasia(List<String> areaArr);

	List<StatisList> selectList();

	List<StatisList> selectList(Map<String, String> search);

}
