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
public class ReviewAttach implements Serializable {
	
	private String rewAtId;
	private String rewBoId;
	private String rewAtOriginalName;
	private String rewAtRenamedName;
	private Date rewAtUploadDate;

}
