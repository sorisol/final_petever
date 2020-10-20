package com.kh.petever.reviewBoard.model.vo;

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
public class ReviewComment {
	
	private int rewCoId;
	private int rewBoId;
	private String userId;
	private String rewCoContent;
	private int rewCoLevel;
	private String rewCoDate;
	private int rewCoRef;

}
