package com.kh.petever.animalboard.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

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
public class AnimalBoard  implements Serializable{

	private int aniBoId;
	private String userId;
	private String aniBoTitle;
	private String aniBoContent;
	private String aniBoDate;
	private String aniBoTag;
	private String aniBoLocal;
	private String aniBoType;
	private String aniBoKind;
	private String aniBoGender;
	private String aniBoAge;
	private String aniBoSize;
	private String aniBoHair;
	private String aniBoColor;
	private String aniBoCha;
	private String aniBoMissDate;
	
	private List<AnimalAttach> attachList;
}
