package com.kh.petever.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.petever.admin.model.vo.AdminUser;
import com.kh.petever.admin.model.vo.Report;

public interface AdminDao {

	List<AdminUser> selectList(RowBounds rowBounds);

	int adminDel(String id);

	List<AdminUser> selectList(String keyword);

	List<Report> reportList(RowBounds rowBounds);

	int reportDel(String no);

	int reportYN(Map<String, Object> map);

	List<Report> searchReport(String keyword);

	int totalUser();

	int totalReport();



}
