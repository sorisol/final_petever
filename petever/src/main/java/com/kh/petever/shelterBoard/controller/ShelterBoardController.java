package com.kh.petever.shelterBoard.controller;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.xml.sax.SAXException;

import com.kh.petever.common.XmlParserUtil;
import com.kh.petever.shelterBoard.model.service.ShelterBoardService;
import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shelterBoard")
@Slf4j
public class ShelterBoardController {
	
	@Autowired
	private ShelterBoardService shelterBoardService;

	String serviceKey = "0oxoWLIMN%2BGCfVq7BsLiAFpHnGopa6SVnMkjsPVZ8zGyPBR89l2H%2FRpS6IvjnMDLpYFxpmFjBzhWbDJg4fj6LA%3D%3D";
	
	@GetMapping("/shelterDB")
	public String animalDb() {
		
		RestTemplate template = new RestTemplate();
		String addressAnimal = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20170101&endde=20200924&pageNo=1&numOfRows=30000&ServiceKey=";
		
		URI uri = null;
		try {
			uri = new URI(addressAnimal + serviceKey);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		String animal = template.getForObject(uri, String.class);
		
		Map<String, Object> map = null;
		try {
			map = XmlParserUtil.XmlToMap(animal);
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
		
//		System.out.println(map);
		ShelterAnimal sa = new ShelterAnimal();
		
		for(String key : map.keySet()) {
			System.out.println(String.format("key: %s, 값: %s", key, map.get(key)));
			List<Map<String, String>> list = (List<Map<String, String>>) map.get(key);
			
			for(int i=0; i<list.size(); i++) {
//				System.out.println(list.get(i));
				Map<String, String> map1 = list.get(i);
//				System.out.println(map1);
//				for(String "" : map1.keySet()) {
//					System.out.println(String.format("key: %s, 값: %s", "", map1.get("")));
//					
//				}
				sa.setDesertionNo(map1.get("desertionNo"));
				sa.setFileName(map1.get("filename"));
				sa.setHappenDt(map1.get("happenDt"));
				sa.setHappenPlace(map1.get("happenPlace"));
				sa.setKindCd(map1.get("kindCd"));
				sa.setColorCd(map1.get("colorCd"));
				sa.setAge(map1.get("age"));
				sa.setWeight(map1.get("weight"));
				sa.setNoticeNo(map1.get("noticeNo"));
				sa.setNoticeSdt(map1.get("noticeSdt"));
				sa.setNoticeEdt(map1.get("noticeEdt"));
				sa.setPopfile(map1.get("popfile"));
				sa.setProcessState(map1.get("processState"));
				sa.setGenderCd(map1.get("sexCd"));
				sa.setNeuterYn(map1.get("neuterYn"));
				sa.setSpecialMark(map1.get("specialMark"));
				sa.setCareNm(map1.get("careNm"));
				sa.setCareTel(map1.get("careTel"));
				sa.setCareAddr(map1.get("careAddr"));
				sa.setOrgNm(map1.get("orgNm"));
				sa.setChargeNm(map1.get("chargeNm"));
				sa.setOfficetel(map1.get("officetel"));
				
//				System.out.println(sa);
				int result = shelterBoardService.insertShelterAnimal(sa);
				
				String msg = result > 0 ? "보호소 동물 등록 성공 :)" : "보호소 동물 등록 실패ㅜ";
//				log.debug("등록 결과 {}", msg);
			}
			
		}
		
		return "shelterBoard/shelterBoard";
	}
	
	@GetMapping("/shelterBoard.do")
	public String shelterBoard(Model model) {
		RestTemplate template = new RestTemplate();
		String addressSido1 = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido?ServiceKey=";
		String addressSido2 = "&pageNo=1&numOfRows=20";
		
		URI uri = null;
		try {
			uri = new URI(addressSido1 + serviceKey + addressSido2);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		String sido = template.getForObject(uri, String.class);
				
		try {
			model.addAttribute("sidoMap", XmlParserUtil.XmlToMap(sido));
//			System.out.println(XmlParserUtil.XmlToMap(obj));
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
//		log.debug(obj);
		
		return "shelterBoard/shelterBoard";
	}
	
	@GetMapping("/sigugun.do")
	public Map<String, Object> sigugun(Model model, @RequestParam("sido")String sido) throws SAXException, IOException, ParserConfigurationException {
		log.debug("시도 번호: {}",  sido);
		
		RestTemplate template = new RestTemplate();
		String address1 = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sigungu?upr_cd=";
		String address2 = "&ServiceKey=";
		
		URI uri = null;
		
		try {
			uri = new URI(address1 + sido + address2 + serviceKey);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		String obj = template.getForObject(uri, String.class);
		
		System.out.println(XmlParserUtil.XmlToMap(obj));

		return XmlParserUtil.XmlToMap(obj);
	}
	

}
