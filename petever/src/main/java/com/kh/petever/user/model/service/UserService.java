package com.kh.petever.user.model.service;

import com.kh.petever.user.model.vo.User;

public interface UserService {

	int insertUser(User user);
	
	User selectOneUser(String userId);
	

	int updateUser(User user);




}
