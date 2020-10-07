package com.kh.petever.admin.model.dao;

import java.util.List;

import com.kh.petever.admin.model.vo.AdminUser;

public interface AdminDao {

	List<AdminUser> selectList();

	int adminDel(String id);

	List<AdminUser> selectList(String keyword);



}
