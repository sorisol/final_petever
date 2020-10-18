package com.kh.petever.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

	@Override
	public int userDelete(User user) {
		return sqlSession.delete("user.userDelete", user);
	}

	@Override
	public List<User> selectUserList(String userPhone) {
		return sqlSession.selectList("user.selectUserList", userPhone);
	}


}	

