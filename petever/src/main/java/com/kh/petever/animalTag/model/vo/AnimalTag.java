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
	private String color;
	private String font;
	private String aniName;
	private Date aniBirth;
	private String aniGender;
	private String aniSsn;
	private String personName;
	private String personPhone;
	private String ssgName;
	private String ssgTel;
	private String ssgAddr1;
	private String ssgAddr2;

}
