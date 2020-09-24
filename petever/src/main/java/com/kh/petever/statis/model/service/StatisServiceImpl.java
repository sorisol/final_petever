package com.kh.petever.statis.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.dao.StatisDao;

@Service
public class StatisServiceImpl implements StatisService {

	@Autowired
	private StatisDao statisDao;

	@Override
	public int insertXml(ShelterAnimal statis) {
		return statisDao.insertXml(statis);
	}

	@Override
	public int countStatis() {
		return statisDao.countStatis();
	}

	@Override
	public int protectCount() {
		return statisDao.protectCount();
	}

	@Override
	public int dismissCount() {
		return statisDao.dismissCount();
	}

	@Override
	public int returnCount() {
		return statisDao.returnCount();
	}

	@Override
	public int deathCount() {
		return statisDao.deathCount();
	}

	@Override
	public int euthanasiaCount() {
		return statisDao.euthanasiaCount();
	}

	@Override
	public int radiateCount() {
		return statisDao.radiateCount();
	}

	@Override
	public int donationCount() {
		return statisDao.donationCount();
	}

	@Override
	public int countStatis(Map<String, String> search) {
		return statisDao.countStatis(search);
	}

	@Override
	public int protectCount(Map<String, String> search) {
		return statisDao.protectCount(search);
	}

	@Override
	public int returnCount(Map<String, String> search) {
		return statisDao.returnCount(search);
	}

	@Override
	public int dismissCount(Map<String, String> search) {
		return statisDao.dismissCount(search);
	}

	@Override
	public int deathCount(Map<String, String> search) {
		return statisDao.deathCount(search);
	}

	@Override
	public int euthanasiaCount(Map<String, String> search) {
		return statisDao.euthanasiaCount(search);
	}

	@Override
	public int radiateCount(Map<String, String> search) {
		return statisDao.radiateCount(search);
	}

	@Override
	public int donationCount(Map<String, String> search) {
		return statisDao.donationCount(search);
	}

}
