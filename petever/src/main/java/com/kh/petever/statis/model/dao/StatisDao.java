package com.kh.petever.statis.model.dao;

import java.util.Map;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

public interface StatisDao {


	int insertXml(ShelterAnimal statis);

	int countStatis();

	int protectCount();

	int dismissCount();

	int returnCount();

	int deathCount();

	int euthanasiaCount();

	int radiateCount();

	int donationCount();

	int countStatis(Map<String, String> search);

	int protectCount(Map<String, String> search);

	int returnCount(Map<String, String> search);

	int dismissCount(Map<String, String> search);

	int deathCount(Map<String, String> search);

	int euthanasiaCount(Map<String, String> search);

	int radiateCount(Map<String, String> search);

	int donationCount(Map<String, String> search);

	int adoptStatis(String area);

	int euthanasia(String area);

}
