package com.kh.petever.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;


//	@Override
//	public List<StatisList> selectList(String kind) {
//		return statisDao.selectList(kind);
//	}

}
