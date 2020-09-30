package com.kh.petever.animalboard.model.vo;

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
public class AnimalComment implements Serializable {

	private int aniCoId;
	private int aniBoId;
	private String userId;
	private String aniCoContent;
	private int aniCoLevel;
	private int aniCoRef;
	private String aniCoDate;
	
}
