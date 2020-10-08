package com.kh.petever.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.admin.model.vo.AdminUser;

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

}
