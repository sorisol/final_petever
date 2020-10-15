package com.kh.petever.user.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User implements Serializable {

	
	private String userId;
	private String userPwd;
	private String userEmail;
	private Date userBirth;
	private String userPhone;
	private String postNo;
	private String userLocal;
	private String userLocalDetail;
	private String userRole;
	

}