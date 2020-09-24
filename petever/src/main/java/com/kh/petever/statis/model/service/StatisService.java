package com.kh.petever.statis.model.service;

import com.kh.petever.statis.model.vo.Statis;

public interface StatisService {

	int insertXml(Statis statis);

	Statis selectStatis();

	int countStatis();



}
