package com.kh.petever.shelterBoard.model.vo;

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
public class ShelterAnimal implements Serializable {
	
	private String desertionNo; // 유기번호 
	private String fileName; //Thumbnail Image;
//	private String happenDt; //접수일 (YYYYMMDD)
	private Date happenDt; //접수일 (YYYYMMDD)
	private String happenPlace; //발견장소
	private String kindCd; //품종
	private String colorCd; //동물 색상
	private String age; //나이
	private String weight; //무게
	private String noticeNo; //공고번호
//	private String noticeSdt; //공고 시작일 (YYYYMMDD)
//	private String noticeEdt; //공고 종료일 (YYYYMMDD)
	private Date noticeSdt; //공고 시작일 (YYYYMMDD)
	private Date noticeEdt; //공고 종료일 (YYYYMMDD)
	private String popfile; //image
	private String processState; //상태
	private String genderCd; //성별 M:수컷, F:암컷, Q:미상
	private String neuterYn; //중성화여부 Y, N, U(미상)
	private String SpecialMark; //특징
	private String careNm; //보호소 이름
	private String careTel; //보호소 전화번호
	private String careAddr; //보호소 주소
	private String orgNm; //관할기관
	private String chargeNm; //보호소 담당자
	private String officetel; //담당자 연락처
	
}
