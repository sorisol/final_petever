package com.kh.petever.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.admin.model.dao.AdminDao;
import com.kh.petever.admin.model.vo.AdminUser;
import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.animalTag.model.vo.AnimalTag;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public List<AdminUser> selectList() {
		return adminDao.selectList();
	}

	@Override
	public int adminDel(String id) {
		return adminDao.adminDel(id);
	}

	@Override
	public List<AdminUser> selectList(String keyword) {
		return adminDao.selectList(keyword);
	}

	@Override
	public List<Report> reportList() {
		return adminDao.reportList();
	}

	@Override
	public int reportDel(String no) {
		return adminDao.reportDel(no);
	}

	@Override
	public int reportYN(Map<String, Object> map) {
		return adminDao.reportYN(map);
	}

	@Override
	public List<Report> searchReport(String keyword) {
		return adminDao.searchReport(keyword);
	}

	@Override
	public int totalUser() {
		return adminDao.totalUser();
	}

	@Override
	public int totalAnimalReport() {
		return adminDao.totalAnimalReport();
	}

	@Override
	public int reportRemove(String no) {
		return adminDao.reportRemove(no);
	}

	@Override
	public int reportReviewDel(String no) {
		return adminDao.reportReviewDel(no);
	}

	@Override
	public List<Report> reportReviewList() {
		return adminDao.reportReviewList();
	}

	@Override
	public List<Report> searchReviewReport(String keyword) {
		return adminDao.searchReviewReport(keyword);
	}

	@Override
	public int totalSearchUser(String keyword) {
		return adminDao.totalSearchUser(keyword);
	}

	@Override
	public int totalReviewReport() {
		return adminDao.totalReviewReport();
	}

	@Override
	public List<Report> reportYn(String yn) {
		return adminDao.reportYn(yn);
	}

	@Override
	public List<Report> animalYn(String yn) {
		return adminDao.animalYn(yn);
	}

	@Override
	public int adminRole(Map<String, String> map) {
		return adminDao.adminRole(map);
	}

	@Override
	public List<Report> searchRole(String role) {
		return adminDao.searchRole(role);
	}

	@Override
	public List<Report> reportList(String day) {
		return adminDao.reportList(day);
	}

	@Override
	public List<Report> reportReviewList(String day) {
		return adminDao.reportReviewList(day);
	}

	@Override
	public int animalDayCnt(String day) {
		return adminDao.animalDayCnt(day);
	}

	@Override
	public int reviewDayCnt(String day) {
		return adminDao.reviewDayCnt(day);
	}

	@Override
	public List<AnimalTag> selectTagList() {
		return adminDao.selectTagList();
	}


}
