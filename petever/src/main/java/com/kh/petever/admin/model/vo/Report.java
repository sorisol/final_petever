package com.kh.petever.admin.model.vo;

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
public class Report implements Serializable{

	private int aniBoId;
	private String userId;
	private String repContent;
	private String repDisplay;
	private String repDate;
	private String repDoUser;
	private int reportId;
}
