package com.kh.petever.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.admin.model.dao.AdminDao;
import com.kh.petever.admin.model.vo.AdminUser;
import com.kh.petever.admin.model.vo.Report;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public List<AdminUser> selectList(RowBounds rowBounds) {
		return adminDao.selectList(rowBounds);
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
	public List<Report> reportList(RowBounds rowBounds) {
		return adminDao.reportList(rowBounds);
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
	public int totalReport() {
		return adminDao.totalReport();
	}


}
