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
public class AdoptApplication implements Serializable{

	private int adoptId;
	private int aniBoId;
	private String senderId;
	private String senderLocal;
	private String senderPhone;
	private String senderJob;
	private String senderHome;
	private String a1;
	private String a2;
	private String a3;
	private String a4;
	private String a5;
	private String a6;
	private String a7;
	private String a8;
	private String a9;
	private String a10;
	private String a11;
	private String a12;
	private String a13;
}
