package com.kh.petever.statis.model.vo;

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
public class Statis implements Serializable {

	private int no;
	private String kind;
	private String state;
	private String org;
	private String careAddr;
	private String happenDay;
	private String fileName;
	
	
}
