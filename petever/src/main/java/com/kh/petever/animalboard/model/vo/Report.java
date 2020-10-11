package com.kh.petever.animalboard.model.vo;

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
public class Report {

	private int aniBoId;
	private String userId;
	private String repContent;
	private String repDisplay;
	private String repDate;
	private String repDoUser;
}
