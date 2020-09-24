package com.kh.petever.statis.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.statis.model.vo.Statis;

@Repository
public class StatisDaoImpl implements StatisDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertXml(Statis statis) {
		return session.insert("statis.insertXml",statis);
	}

//	@Override
//	public int insertDev(Dev dev) {
//		return session.insert("demo.insertDev", dev);
//	}

	
}
