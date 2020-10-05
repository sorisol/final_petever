package com.kh.petever.statis.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.vo.StatisList;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class StatisDaoImpl implements StatisDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertXml(ShelterAnimal statis) {
		return session.insert("statis.insertXml",statis);
	}

	@Override
	public List<StatisList> adoptStatis(List<String> areaArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areaArr",areaArr);
		return session.selectList("statis.adoptStatis",map);
	}

	@Override
	public List<StatisList> euthanasia(List<String> areaArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areaArr",areaArr);
		return session.selectList("statis.euthanasia",map);
	}

	@Override
	public List<StatisList> selectList() {
		return session.selectList("statis.selectList");
	}

	@Override
	public List<StatisList> selectList(Map<String, String> search) {
		return session.selectList("statis.countStatisSearch",search);
	}

	@Override
	public List<StatisList> euthanasiaSearch(List<String> areaArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areaArr",areaArr);
		return session.selectList("statis.euthanasiaSearch",map);
	}

	@Override
	public List<StatisList> adoptStatisSearch(List<String> areaArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areaArr",areaArr);
		return session.selectList("statis.adoptStatisSearch",map);
	}

	@Override
	public List<StatisList> selectList(List<String> searchArea) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchArea",searchArea);
		return session.selectList("statis.selectListMain",map);
	}

	@Override
	public List<StatisList> selectList(String kind) {
		return session.selectList("statis.selectListKind",kind);
	}

}
