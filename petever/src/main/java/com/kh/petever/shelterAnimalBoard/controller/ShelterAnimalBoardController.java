package com.kh.petever.shelterAnimalBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.petever.common.Utils;
import com.kh.petever.shelterAnimalBoard.model.service.ShelterAnimalBoardService;
import com.kh.petever.shelterAnimalBoard.model.vo.ShelterAnimalBoard;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shelter")
@Slf4j
public class ShelterAnimalBoardController {
	
	@Autowired
	private ShelterAnimalBoardService shelterAniBoardService;
	
	@PostMapping("/shelterAnimalBoardXml.do")
	public String shelterAnimalBoardXml(ShelterAnimalBoard shelterAniBoard) {
	String serviceKey = "http://openapi.animal.go.kr/openapi/service/rest/animalShelterSrvc/shelterInfo?serviceKey=0oxoWLIMN%2BGCfVq7BsLiAFpHnGopa6SVnMkjsPVZ8zGyPBR89l2H%2FRpS6IvjnMDLpYFxpmFjBzhWbDJg4fj6LA%3D%3D&numOfRows=400";
	
	DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder;

		try {
			dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(serviceKey);
			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수 :  5
			
			for(int temp = 0; temp < nList.getLength(); temp++){		
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					System.out.println("######################");
	//				System.out.println("1  : " + getTagValue("desertionNo", eElement));
	//				System.out.println("2  : " + getTagValue("happenDt", eElement));
	//				System.out.println("3  : " + getTagValue("orgNm", eElement));
	//				System.out.println("4  : " + getTagValue("happenPlace", eElement));
					shelterAniBoard.setCareName(getTagValue("careNm", eElement));
					shelterAniBoard.setCareAddr(getTagValue("careAddr", eElement));
					shelterAniBoard.setCareTel(getTagValue("careTel", eElement));
					shelterAniBoard.setLat(getTagValue("lat", eElement));
					shelterAniBoard.setLng(getTagValue("lng", eElement));
					shelterAniBoard.setDivisionName(getTagValue("divisionNm", eElement));
					shelterAniBoard.setSaveAnimal(getTagValue("saveTrgtAnimal", eElement));
					shelterAniBoard.setWeekOprStime(getTagValue("weekOprStime", eElement));
					shelterAniBoard.setWeekOprEtime(getTagValue("weekOprEtime", eElement));
					shelterAniBoard.setWeekendOprStime(getTagValue("weekendOprStime", eElement));
					shelterAniBoard.setWeekendOprEtime(getTagValue("weekendOprEtime", eElement));
					shelterAniBoard.setWeekCellStime(getTagValue("weekCellStime", eElement));
					shelterAniBoard.setWeekCellEtime(getTagValue("weekCellEtime", eElement));
					shelterAniBoard.setWeekendCellStime(getTagValue("weekendCellStime", eElement));
					shelterAniBoard.setWeekendCellEtime(getTagValue("weekendCellEtime", eElement));
					shelterAniBoard.setCloseDay(getTagValue("closeDay", eElement));
					shelterAniBoard.setVetPersonCnt(getTagValueInt("vetPersonCnt", eElement));
					shelterAniBoard.setSpecsPersonCnt(getTagValueInt("specsPersonCnt", eElement));
					shelterAniBoard.setMedicalCnt(getTagValueInt("medicalCnt", eElement));
					shelterAniBoard.setBreedCnt(getTagValueInt("breedCnt", eElement));
					shelterAniBoard.setQuarabtineCnt(getTagValueInt("quarabtineCnt", eElement));
					shelterAniBoard.setFeedCnt(getTagValueInt("feedCnt", eElement));
					shelterAniBoard.setTransCarCnt(getTagValueInt("transCarCnt", eElement));
					shelterAniBoard.setOrgName(getTagValue("orgNm", eElement));
					shelterAniBoard.setDsignationDate(getTagValue("dsignationDate", eElement));
					shelterAniBoard.setDataStdDate(getTagValue("dataStdDt", eElement));
					int result = shelterAniBoardService.insertXml(shelterAniBoard);
					System.out.println( result > 0 ? "성공" : "실패");
					
				}	// for end
			}	// if end
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/shelter/shelterAnimalBoard";
	}
	
	private static String getTagValue(String tag, Element eElement) {
		try {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			if(nValue == null) 
				return "";
			return nValue.getNodeValue();
		} catch (Exception e) {
		}
		return "";
	}
	
	private static int getTagValueInt(String tag, Element eElement) {
		try {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			if(nValue == null) 
				return 0;
			return Integer.parseInt(nValue.getNodeValue());
		} catch (Exception e) {
		}
		return 0;
	}
	
	@GetMapping("/shelterAnimalBoard.do")
	public String ShelterAnimalBoard(Model model, @RequestParam(defaultValue = "1", value = "cPage")int cPage,
			@RequestParam(defaultValue = "", value="city")String city, @RequestParam(defaultValue = "", value="province")String province,
			@RequestParam(defaultValue = "", value="shelterName")String shelterName, HttpServletRequest request) {
		
		//page 처리
		final int limit = 10;
		int offset = (cPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		Map<String, String> param = new HashMap<>();
		param.put("city", city);
		param.put("province", province);
		param.put("shelterName", shelterName);
		log.debug("param={}", param);
		
		List<ShelterAnimalBoard> list = shelterAniBoardService.shelterAniBoardSelect(param, rowBounds);
		log.debug("list={}", list);
		
		String url = request.getRequestURI() + "?city=" + city + "&province=" + province + "&shlterName=" + shelterName + "&";
		int totalContents = shelterAniBoardService.shelterAniBoardCount(param);
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageBar", pageBar);
		
		return "/shelter/shelterAnimalBoard";
	}
	
	@GetMapping("/shelterAnimalBoardDetail.do")
	public String shelterAniDetail(Model model, @RequestParam String shelterNo) {
		
		ShelterAnimalBoard shelterAniBoard = shelterAniBoardService.shelterAniDetailSelect(shelterNo);
		log.debug("dateil = {}", shelterAniBoard);
		
		model.addAttribute("sab", shelterAniBoard);
		
		return "/shelter/shelterDetail";
	}
	
	
	
	
}
