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
	private String password;
	private String email;
	private Date birthDay;
	private String phone;
	private String address;
	private String userRole;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String password, String email, Date birthDay, String phone, String address,
			String userRole) {
		super();
		this.userId = userId;
		this.password = password;
		this.email = email;
		this.birthDay = birthDay;
		this.phone = phone;
		this.address = address;
		this.userRole = userRole;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", email=" + email + ", birthDay=" + birthDay
				+ ", phone=" + phone + ", address=" + address + ", userRole=" + userRole + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	
}
