package com.kh.petever.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class User implements Serializable {

	
	private String userId;
	private String userPwd;
	private String userEmail;
	private Date userBirth;
	private String userPhone;
	private String userLocal;
	private String userRole;
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User(String userId, String userPwd, String userEmail, Date userBirth, String userPhone, String userLocal,
			String userRole) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userBirth = userBirth;
		this.userPhone = userPhone;
		this.userLocal = userLocal;
		this.userRole = userRole;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userEmail=" + userEmail + ", userBirth="
				+ userBirth + ", userPhone=" + userPhone + ", userLocal=" + userLocal + ", userRole=" + userRole + "]";
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public Date getUserBirth() {
		return userBirth;
	}


	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserLocal() {
		return userLocal;
	}


	public void setUserLocal(String userLocal) {
		this.userLocal = userLocal;
	}


	public String getUserRole() {
		return userRole;
	}


	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	
}