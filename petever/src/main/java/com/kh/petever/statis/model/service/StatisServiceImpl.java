package com.kh.petever.statis.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.statis.model.dao.StatisDao;
import com.kh.petever.statis.model.vo.Statis;

@Service
public class StatisServiceImpl implements StatisService {

	@Autowired
	private StatisDao statisDao;

	@Override
	public int insertXml(Statis statis) {
		return statisDao.insertXml(statis);
	}

//	@Override
//	public int insertDev(Dev dev) {
//		return demoDao.insertDev(dev);
//	}

	

}
