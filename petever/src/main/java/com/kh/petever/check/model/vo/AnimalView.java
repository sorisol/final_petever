package com.kh.petever.check.model.vo;

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
public class AnimalView implements Serializable {

	private String desertionNo;
	private String fileName;
	private String age;
	private String weight;
	private String genderCd;
	
	
}
