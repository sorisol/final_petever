package com.kh.petever.statis.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.service.StatisService;

import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/statis")
@Slf4j
public class StatisController {
	@Autowired
	private StatisService statisService;
	
	@PostMapping("/statisXml.do")
//	@RequestMapping(value="/statis.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String statisXml(ShelterAnimal statis) {
		String serviceKey = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20190101&endde=20200925&pageNo=3&numOfRows=100000&ServiceKey=8K6TziMrpfFbxxnak21vb%2B1P77px04rGI6I5hJxhxlzk2pcZzthYznTc9ZfSOox93LUNH3Z1PbMaF%2FVk62rUjQ%3D%3D";
		
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
					System.out.println("1  : " + getTagValue("desertionNo", eElement));
					System.out.println("2  : " + getTagValue("happenDt", eElement));
					System.out.println("3  : " + getTagValue("orgNm", eElement));
					System.out.println("4  : " + getTagValue("happenPlace", eElement));
					statis.setDesertionNo(getTagValue("desertionNo", eElement));
					statis.setFileName(getTagValue("filename", eElement));
					statis.setHappenDt(getTagValue("happenDt", eElement));
					statis.setHappenPlace(getTagValue("happenPlace", eElement));
					statis.setKindCd(getTagValue("kindCd", eElement));
					statis.setColorCd(getTagValue("colorCd", eElement));
					statis.setAge(getTagValue("age", eElement));
					statis.setWeight(getTagValue("weight", eElement));
					statis.setNoticeNo(getTagValue("noticeNo", eElement));
					statis.setNoticeSdt(getTagValue("noticeSdt", eElement));
					statis.setNoticeEdt(getTagValue("noticeEdt", eElement));
					statis.setPopfile(getTagValue("popfile", eElement));
					statis.setProcessState(getTagValue("processState", eElement));
					statis.setGenderCd(getTagValue("sexCd", eElement));
					statis.setNeuterYn(getTagValue("neuterYn", eElement));
					statis.setSpecialMark(getTagValue("specialMark", eElement));
					statis.setCareNm(getTagValue("careNm", eElement));
					statis.setCareTel(getTagValue("careTel", eElement));
					statis.setCareAddr(getTagValue("careAddr", eElement));
					statis.setOrgNm(getTagValue("orgNm", eElement));
					statis.setChargeNm(getTagValue("chargeNm", eElement));
					statis.setOfficetel(getTagValue("officetel", eElement));
					int result = statisService.insertXml(statis);
					System.out.println( result > 0 ? "성공" : "실패");
					
				}	// for end
			}	// if end
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "statis/statis";
	}

	private static String getTagValue(String tag, Element eElement) {
		try {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			if(nValue == null) 
				return "null";
			return nValue.getNodeValue();
		} catch (Exception e) {
		}
		return "null";
	}


	@GetMapping("/statis.do")
	public ModelAndView statis(ModelAndView mav	,
			@RequestParam(value="city", required=false) String city,
			@RequestParam(value="province", required=false) String province,
			@RequestParam(value="startDay", required=false) String startDay,
			@RequestParam(value="endDay", required=false) String endDay) {
		DecimalFormat df = new DecimalFormat("###,###");
		int allCnt;
		int protectCnt;
		int dismissCnt;
		int returnCnt;
		int deathCnt;
		int euthanasiaCnt;
		int radiateCnt;
		int donationCnt;
		System.out.println(city);
		System.out.println(province);
		System.out.println(startDay);
		System.out.println(endDay);
		Map<String, String> search = new HashMap<>();
		search.put("city", "%"+city+" "+province+"%");
		search.put("startDay", startDay);
		search.put("endDay", endDay);
		if(city == null || province == null || startDay == null || endDay == null) {
			allCnt = statisService.countStatis();
			protectCnt = statisService.protectCount();
			dismissCnt = statisService.dismissCount();
			returnCnt = statisService.returnCount();
			deathCnt = statisService.deathCount();
			euthanasiaCnt = statisService.euthanasiaCount();
			radiateCnt = statisService.radiateCount();
			donationCnt = statisService.donationCount();
		}else{
			allCnt = statisService.countStatis(search);
			protectCnt = statisService.protectCount(search);
			dismissCnt = statisService.dismissCount(search);
			returnCnt = statisService.returnCount(search);
			deathCnt = statisService.deathCount(search);
			euthanasiaCnt = statisService.euthanasiaCount(search);
			radiateCnt = statisService.radiateCount(search);
			donationCnt = statisService.donationCount(search);
		}
		System.out.println(allCnt);
		mav.addObject("allCnt",df.format(allCnt));
		mav.addObject("protectCnt",protectCnt);
		mav.addObject("dismissCnt",dismissCnt);
		mav.addObject("returnCnt",returnCnt);
		mav.addObject("deathCnt",deathCnt);
		mav.addObject("euthanasiaCnt",euthanasiaCnt);
		mav.addObject("radiateCnt",radiateCnt);
		mav.addObject("donationCnt",donationCnt);
		mav.setViewName("statis/statis");
		return mav;
	}

}
