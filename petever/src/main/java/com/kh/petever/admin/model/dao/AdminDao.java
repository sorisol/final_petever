package com.kh.petever.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.petever.admin.model.vo.AdminUser;
import com.kh.petever.admin.model.vo.Report;
import com.kh.petever.animalTag.model.vo.AnimalTag;

public interface AdminDao {

	List<AdminUser> selectList();

	int adminDel(String id);

	List<AdminUser> selectList(String keyword);

	List<Report> reportList();

	int reportDel(String no);

	int reportYN(Map<String, Object> map);

	List<Report> searchReport(String keyword);

	int totalUser();

	int reportRemove(String no);

	int reportReviewDel(String no);

	List<Report> reportReviewList();

	List<Report> searchReviewReport(String keyword);

	int totalSearchUser(String keyword);

	int totalAnimalReport();

	int totalReviewReport();

	List<Report> reportYn(String yn);

	List<Report> animalYn(String yn);

	int adminRole(Map<String, String> map);

	List<Report> searchRole(String role);

	List<Report> reportList(String day);

	List<Report> reportReviewList(String day);

	int animalDayCnt(String day);

	int reviewDayCnt(String day);

	List<AnimalTag> selectTagList();



}
