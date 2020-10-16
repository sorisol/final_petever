package com.kh.petever.shelterAnimalBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ShelterAnimalBoard {
	
	private String shelterNo;		
	private String careName;		//동물보호센터명
	private String careAddr;		//소재지도로명주소
	private String careTel; 		//전화번호
	private String lat;				//위도
	private String lng;				//경도
	private String divisionName;	//동물보호센터유형
	private String saveAnimal;		//구조대상동물
	private String weekOprStime;	//평일운영시작시각
	private String weekOprEtime;	//평일운영종료시각
	private String weekendOprStime; //주말운영시작시각
	private String weekendOprEtime; //주말운영종료시각
	private String weekCellStime;	//평일분양시작시각
	private String weekCellEtime;	//평일분양종료시각
	private String weekendCellStime;//주말분양시작시각
	private String weekendCellEtime;//주말분양종료시각
	private String closeDay;		//휴무일
	private int vetPersonCnt;	//수의사 인원수
	private int specsPersonCnt;	//사양관리사 인원수
	private int medicalCnt; 		//진료실 개수
	private int breedCnt; 			//사육실 개수
	private int quarabtineCnt; 		//격리실 개수
	private int feedCnt; 			//사료보관실 개수
	private int transCarCnt; 			//구조운반용차량 보유대수
	private String orgName;			//관리기관명
	private String dsignationDate;	//동물보호센터지정일자
	private String dataStdDate;		//데이터기준일자

}
