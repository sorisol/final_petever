package com.kh.petever.user.model.service;

import java.util.List;

import com.kh.petever.user.model.vo.User;

public interface UserService {

	int insertUser(User user);
	
	User selectOneUser(String userId);
	
	int updateUser(User user);
	
	int userDelete(User user);

	List<User> selectUserList(String userPhone);

	User selectSearchPwd(User user);

	int updateUserPwd(User userOk);

	int updateSigNo(User user);




}
