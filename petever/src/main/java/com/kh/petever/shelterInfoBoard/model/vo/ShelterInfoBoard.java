package com.kh.petever.shelterInfoBoard.model.vo;

import java.io.Serializable;

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
public class ShelterInfoBoard implements Serializable{

//	private int rnum;
//	private String closeDay;
	
	private int start;
	private int length;
	
	private String orgNm;
	private String careNm;
	private String careTel;
	private String careAddr;
	private int pageNo;
	private String totalCount;
	
	private String care_reg_no;
	private int care_nm;
		
	}
