package com.kh.petever.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.admin.model.vo.AdminUser;
import com.kh.petever.admin.model.vo.Report;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<AdminUser> selectList(RowBounds rowBounds) {
		return session.selectList("admin.adminUser", null, rowBounds);
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
	public List<Report> reportList(RowBounds rowBounds) {
		return session.selectList("admin.adminReport", null, rowBounds);
	}

	@Override
	public int reportDel(String no) {
		return session.delete("admin.reportDel", no);
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
	public int totalReport() {
		return session.selectOne("admin.totalReport");
	}

}
