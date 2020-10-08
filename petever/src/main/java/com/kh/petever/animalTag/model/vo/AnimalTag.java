package com.kh.petever.animalTag.model.vo;

import java.io.Serializable;
import java.util.Date;

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
public class AnimalTag implements Serializable {
	
	private String userId;
	private int tagNo;
	private String tagColor;
	private String tagFont;
	private String tagAniName;
	private String tagAniBirth;
	private String tagAniGender;
	private String tagAniSsn;
	private String tagPersonName;
	private String tagPersonPhone;
	private String ssgName;
	private String ssgTel;
	private String ssgAddr0;
	private String ssgAddr1;
	private String ssgAddr2;
	private String buyDate;

}
