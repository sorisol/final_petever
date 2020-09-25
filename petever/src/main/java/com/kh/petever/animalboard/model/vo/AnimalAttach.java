package com.kh.petever.animalboard.model.vo;

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
public class AnimalAttach implements Serializable {

	private int aniATId;
	private int aniBoId;
	private String aniAtOriginalName;
	private String aniAtRenamedName;
	private Date aniAtUploadDate;
}
