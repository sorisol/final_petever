package com.kh.petever.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.admin.model.dao.AdminDao;
import com.kh.petever.admin.model.vo.AdminUser;

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


}
