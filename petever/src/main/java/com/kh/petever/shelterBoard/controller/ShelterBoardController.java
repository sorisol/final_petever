package com.kh.petever.shelterBoard.controller;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.xml.sax.SAXException;

import com.kh.petever.common.Utils;
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

	String serviceKey = "8K6TziMrpfFbxxnak21vb%2B1P77px04rGI6I5hJxhxlzk2pcZzthYznTc9ZfSOox93LUNH3Z1PbMaF%2FVk62rUjQ%3D%3D";
	
//	@GetMapping("/shelterDB")
//	public String animalDb() {
//		
//		RestTemplate template = new RestTemplate();
//		String addressAnimal = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20170101&endde=20200924&pageNo=1&numOfRows=100000&ServiceKey=";
//		
//		URI uri = null;
//		try {
//			uri = new URI(addressAnimal + serviceKey);
//		} catch (URISyntaxException e) {
//			e.printStackTrace();
//		}
//		String animal = template.getForObject(uri, String.class);
//		
//		Map<String, Object> map = null;
//		try {
//			map = XmlParserUtil.XmlToMap(animal);
//		} catch (SAXException | IOException | ParserConfigurationException e) {
//			e.printStackTrace();
//		}
//		
////		System.out.println(map);
//		ShelterAnimal sa = new ShelterAnimal();
//		
//		for(String key : map.keySet()) {
//			System.out.println(String.format("key: %s, 값: %s", key, map.get(key)));
//			List<Map<String, String>> list = (List<Map<String, String>>) map.get(key);
//			
//			for(int i=0; i<list.size(); i++) {
////				System.out.println(list.get(i));
//				Map<String, String> map1 = list.get(i);
////				System.out.println(map1);
////				for(String "" : map1.keySet()) {
////					System.out.println(String.format("key: %s, 값: %s", "", map1.get("")));
////					
////				}
//				sa.setDesertionNo(map1.get("desertionNo"));
//				sa.setFileName(map1.get("filename"));
//				sa.setHappenDt(map1.get("happenDt"));
//				sa.setHappenPlace(map1.get("happenPlace"));
//				sa.setKindCd(map1.get("kindCd"));
//				sa.setColorCd(map1.get("colorCd"));
//				sa.setAge(map1.get("age"));
//				sa.setWeight(map1.get("weight"));
//				sa.setNoticeNo(map1.get("noticeNo"));
//				sa.setNoticeSdt(map1.get("noticeSdt"));
//				sa.setNoticeEdt(map1.get("noticeEdt"));
//				sa.setPopfile(map1.get("popfile"));
//				sa.setProcessState(map1.get("processState"));
//				sa.setGenderCd(map1.get("sexCd"));
//				sa.setNeuterYn(map1.get("neuterYn"));
//				sa.setSpecialMark(map1.get("specialMark"));
//				sa.setCareNm(map1.get("careNm"));
//				sa.setCareTel(map1.get("careTel"));
//				sa.setCareAddr(map1.get("careAddr"));
//				sa.setOrgNm(map1.get("orgNm"));
//				sa.setChargeNm(map1.get("chargeNm"));
//				sa.setOfficetel(map1.get("officetel"));
//				
////				System.out.println(sa);
//				int result = shelterBoardService.insertShelterAnimal(sa);
//				
//				String msg = result > 0 ? "보호소 동물 등록 성공 :)" : "보호소 동물 등록 실패ㅜ";
////				log.debug("등록 결과 {}", msg);
//			}
//		}
//		return "shelterBoard/shelterBoard";
//	}
	
	@GetMapping("/shelterBoard.do")
	public String shelterBoard(Model model, @RequestParam(defaultValue = "1", value="cPage") int cPage, HttpServletRequest request,
			@RequestParam(value="kind", defaultValue="", required = false) String kind, @RequestParam(value="gender", defaultValue="", required = false) String gender,
			@RequestParam(value="age", defaultValue="0", required = false) int age, @RequestParam(value="color", defaultValue="", required = false) String color,
			@RequestParam(value="weight", defaultValue="0", required = false) int weight, @RequestParam(value="state", defaultValue="", required = false) String state,
			@RequestParam(value="sido", defaultValue="", required = false) String sido, @RequestParam(value="sigugun", defaultValue="", required = false) String sigugun) {
		//page 처리
		final int limit = 16;
		int offset = (cPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		String[] vlaues = request.getParameterValues("kind");
		
		
		//조회 DATA 확인
		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("gender", gender);
		map.put("age", age);
		map.put("color", color);
		map.put("weight", weight);
		map.put("state", state);
		map.put("sido", sido);
		map.put("sigugun", sigugun);
		log.debug("map = {}", map);
		
		
		List<ShelterAnimal> list = shelterBoardService.selectAll(map, rowBounds);
//		log.debug("보호소 동물 : {}", list);
		
		String url = request.getRequestURI() + "?kind="+ kind +"&gender=" + gender+ "&age=" + age + "&color=" + color + 
					"&weight=" + weight + "&state=" + state +"&sido=" + sido + "&sigugun=" + sigugun + "&";
		int totalContents = shelterBoardService.shelterAnimalCount(map);
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		model.addAttribute("param", map);
		model.addAttribute("shelterBoardList", list);
		model.addAttribute("pageBar", pageBar);
		
		return "shelterBoard/shelterBoard";
	}
	
	@GetMapping("/shelterAni")
	public String shelterAnimal(Model model, @RequestParam("deserNo") String deserNo) {
		log.debug("deserNo = {}", deserNo);
		
		List<ShelterAnimal> aniList = shelterBoardService.shelterSelectOne(deserNo);
		log.debug("aniList = {}", aniList);
		
		model.addAttribute("aniList", aniList);
		return "shelterBoard/shelterAnimal";
	}
	

	

}
