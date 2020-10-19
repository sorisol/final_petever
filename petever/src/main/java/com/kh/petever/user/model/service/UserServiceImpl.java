package com.kh.petever.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.kh.petever.user.model.dao.UserDAO;
import com.kh.petever.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int insertUser(User user) {
		return userDAO.insertUser(user);
	}

	@Override
	public User selectOneUser(String userId) {
		return userDAO.selectOneUser(userId);
	}
	
	@Override
	public int updateUser(User user) {
		return userDAO.updateUser(user);
	}
	
	@Override
	public int userDelete(User user) {
		return userDAO.userDelete(user);
	}

	@Override
	public List<User> selectUserList(String userPhone) {
		return userDAO.selectUserList(userPhone);
	}

	@Override
	public User selectSearchPwd(User user) {
		return userDAO.selectSearchPwd(user);
	}

	@Override
	public int updateUserPwd(User userOk) {
		return userDAO.updateUserPwd(userOk);
	}

	@Override
	public int updateSigNo(User user) {
		return userDAO.updateSigNo(user);
	}


}
