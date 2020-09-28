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
	public int adoptStatis(List<String> areaArr) {
		return statisDao.adoptStatis(areaArr);
	}

	@Override
	public int euthanasia(List<String> areaArr) {
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

}
