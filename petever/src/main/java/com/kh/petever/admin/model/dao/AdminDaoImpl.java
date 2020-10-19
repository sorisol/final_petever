package com.kh.petever.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.admin.model.vo.AdminUser;
import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.animalTag.model.vo.AnimalTag;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<AdminUser> selectList() {
		return session.selectList("admin.adminUser");
	}

	@Override
	public int adminDel(String id) {
		return session.delete("admin.adminDel",id);
	}

	@Override
	public List<AdminUser> selectList(String keyword) {
		return session.selectList("admin.adminSearch",keyword);
	}

	@Override
	public List<Report> reportList() {
		return session.selectList("admin.adminReport");
	}

	@Override
	public int reportDel(String no) {
		return session.update("admin.reportDel", no);
	}

	@Override
	public int reportYN(Map<String, Object> map) {
		return session.update("admin.reportYN", map);
	}

	@Override
	public List<Report> searchReport(String keyword) {
		return session.selectList("admin.searchReport", keyword);
	}

	@Override
	public int totalUser() {
		return session.selectOne("admin.totalUser");
	}

	@Override
	public int reportRemove(String no) {
		return session.delete("admin.reportRemove", no);
	}

	@Override
	public int reportReviewDel(String no) {
		return session.delete("admin.reportReviewDel", no);
	}

	@Override
	public List<Report> reportReviewList() {
		return session.selectList("admin.reportReviewList");
	}

	@Override
	public List<Report> searchReviewReport(String keyword) {
		return session.selectList("admin.searchReviewReport",keyword);
	}

	@Override
	public int totalSearchUser(String keyword) {
		return session.selectOne("admin.totalSearchUser",keyword);
	}

	@Override
	public int totalAnimalReport() {
		return session.selectOne("admin.totalAnimalReport");
	}

	@Override
	public int totalReviewReport() {
		return session.selectOne("admin.totalReviewReport");
	}

	@Override
	public List<Report> reportYn(String yn) {
		return session.selectList("admin.reportYn",yn);
	}

	@Override
	public List<Report> animalYn(String yn) {
		return session.selectList("admin.animalYn",yn);
	}

	@Override
	public int adminRole(Map<String, String> map) {
		return session.update("admin.adminRole",map);
	}

	@Override
	public List<Report> searchRole(String role) {
		return session.selectList("admin.searchRole",role);
	}

	@Override
	public List<Report> reportList(String day) {
		return session.selectList("admin.adminReportDay",day);
	}

	@Override
	public List<Report> reportReviewList(String day) {
		return session.selectList("admin.reportReviewListDay",day);
	}

	@Override
	public int animalDayCnt(String day) {
		return session.selectOne("admin.animalDayCnt",day);
	}

	@Override
	public int reviewDayCnt(String day) {
		return session.selectOne("admin.reviewDayCnt",day);
	}

	@Override
	public List<AnimalTag> selectTagList() {
		return session.selectList("admin.selectTagList");
	}

}
