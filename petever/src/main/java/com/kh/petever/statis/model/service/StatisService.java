package com.kh.petever.statis.model.service;

import java.util.List;
import java.util.Map;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.vo.StatisList;

public interface StatisService {

	int insertXml(ShelterAnimal statis);

	List<StatisList> adoptStatis(List<String> areaArr);

	List<StatisList> euthanasia(List<String> areaArr);

	List<StatisList> selectList();

	List<StatisList> selectList(Map<String, String> search);

	List<StatisList> euthanasiaSearch(List<String> areaArr);

	List<StatisList> adoptStatisSearch(List<String> areaArr);

}
