package com.kh.petever.reviewBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
public class ReviewBoard implements Serializable {
	
	private int rewBoId;
	private String userId;
	private String rewBoTitle;
	private String RewBoContent;
	private String RewBoRegDate;

}
