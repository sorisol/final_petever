package com.kh.petever.admin.model.service;

import java.util.List;

import com.kh.petever.admin.model.vo.AdminUser;

public interface AdminService {

	List<AdminUser> selectList();

	int adminDel(String id);

	List<AdminUser> selectList(String keyword);

}