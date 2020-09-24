package com.kh.petever.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.user.model.vo.User;


@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	 
	
	@Override
	public int insertUser(User user) {
		return sqlSession.insert("user.insertUser", user);
	}
	
	@Override
	public User selectOneUser(String userId) {
		return sqlSession.selectOne("user.selectOneUser", userId);
	}
	
	@Override
	public int updateUser(User user) {
		return sqlSession.update("user.updateUser", user);
	}
}
