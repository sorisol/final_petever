package com.kh.petever.user.model.dao;

import java.util.List;

import com.kh.petever.user.model.vo.User;

public interface UserDAO {
	
	int insertUser(User user);
	
	User selectOneUser(String userId);

	int updateUser(User user);
	
	//회원탈퇴
	int userDelete(User user);

	List<User> selectUserList(String userPhone);

	User selectSearchPwd(User user);

	int updateUserPwd(User userOk);

	int updateSigNo(User user);
	

}

