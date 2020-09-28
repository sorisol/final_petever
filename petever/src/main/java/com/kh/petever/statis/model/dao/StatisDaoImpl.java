package com.kh.petever.statis.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

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
	public int countStatis() {
		return session.selectOne("statis.countStatis");
	}

	@Override
	public int protectCount() {
		return session.selectOne("statis.protectCount");
	}

	@Override
	public int dismissCount() {
		return session.selectOne("statis.dismissCount");
	}

	@Override
	public int returnCount() {
		return session.selectOne("statis.returnCount");
	}

	@Override
	public int deathCount() {
		return session.selectOne("statis.deathCount");
	}

	@Override
	public int euthanasiaCount() {
		return session.selectOne("statis.euthanasiaCount");
	}

	@Override
	public int radiateCount() {
		return session.selectOne("statis.radiateCount");
	}

	@Override
	public int donationCount() {
		return session.selectOne("statis.donationCount");
	}

	@Override
	public int countStatis(Map<String, String> search) {
		return session.selectOne("statis.countStatisSearch",search);
	}

	@Override
	public int protectCount(Map<String, String> search) {
		return session.selectOne("statis.protectCountSearch",search);
	}

	@Override
	public int returnCount(Map<String, String> search) {
		return session.selectOne("statis.returnCountSearch",search);
	}

	@Override
	public int dismissCount(Map<String, String> search) {
		return session.selectOne("statis.dismissCountSearch",search);
	}

	@Override
	public int deathCount(Map<String, String> search) {
		return session.selectOne("statis.deathCountSearch",search);
	}

	@Override
	public int euthanasiaCount(Map<String, String> search) {
		return session.selectOne("statis.euthanasiaCountSearch",search);
	}

	@Override
	public int radiateCount(Map<String, String> search) {
		return session.selectOne("statis.radiateCountSearch",search);
	}

	@Override
	public int donationCount(Map<String, String> search) {
		return session.selectOne("statis.donationCountSearch",search);
	}

	@Override
	public int adoptStatis(String area) {
		return session.selectOne("statis.adoptStatis",area);
	}

	@Override
	public int euthanasia(String area) {
		return session.selectOne("statis.euthanasia",area);
	}

}
