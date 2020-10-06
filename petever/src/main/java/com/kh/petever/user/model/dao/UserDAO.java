package com.kh.petever.user.model.dao;

import com.kh.petever.user.model.vo.User;

public interface UserDAO {
	
	int insertUser(User user);
	
	User selectOneUser(String userId);

	int updateUser(User user);
	
	//회원탈퇴
	int userDelete(User user);
	
	//아이디 중복체크
	public int idChk(User user);

}
