package com.kh.petever.statis.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.vo.StatisList;

import lombok.extern.slf4j.Slf4j;

@Repository
public class StatisDaoImpl implements StatisDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertXml(ShelterAnimal statis) {
		return session.insert("statis.insertXml",statis);
	}

	@Override
	public int adoptStatis(List<String> areaArr) {
		return session.selectOne("statis.adoptStatis",areaArr);
	}

	@Override
	public int euthanasia(List<String> areaArr) {
		return session.selectOne("statis.euthanasia",areaArr);
	}

	@Override
	public List<StatisList> selectList() {
		return session.selectList("statis.selectList");
	}

	@Override
	public List<StatisList> selectList(Map<String, String> search) {
		return session.selectList("statis.countStatisSearch",search);
	}

}
