package com.kh.petever.statis.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.dao.StatisDao;
import com.kh.petever.statis.model.vo.StatisList;

@Service
public class StatisServiceImpl implements StatisService {

	@Autowired
	private StatisDao statisDao;

	@Override
	public int insertXml(ShelterAnimal statis) {
		return statisDao.insertXml(statis);
	}

	@Override
	public List<StatisList> adoptStatis(List<String> areaArr) {
		return statisDao.adoptStatis(areaArr);
	}

	@Override
	public List<StatisList> euthanasia(List<String> areaArr) {
		return statisDao.euthanasia(areaArr);
	}

	@Override
	public List<StatisList> selectList() {
		return statisDao.selectList();
	}

	@Override
	public List<StatisList> selectList(Map<String, String> search) {
		return statisDao.selectList(search);
	}

	@Override
	public List<StatisList> euthanasiaSearch(List<String> areaArr) {
		return statisDao.euthanasiaSearch(areaArr);
	}

	@Override
	public List<StatisList> adoptStatisSearch(List<String> areaArr) {
		return statisDao.adoptStatisSearch(areaArr);
	}

	@Override
	public List<StatisList> selectList(List<String> searchArea) {
		return statisDao.selectList(searchArea);
	}

	@Override
	public List<StatisList> selectList(String kind) {
		return statisDao.selectList(kind);
	}

}
