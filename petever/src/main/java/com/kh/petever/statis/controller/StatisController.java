package com.kh.petever.statis.controller;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.petever.statis.model.service.StatisService;
import com.kh.petever.statis.model.vo.Statis;

import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/statis")
@Slf4j
public class StatisController {
	
	private StatisService statisService;
	
	@GetMapping("/statis.do")
	public String statisXml() {
		String serviceKey = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20170101&endde=20200924&pageNo=1&numOfRows=451904&ServiceKey=qt%2F%2BL7Li2n81Q1cJHjhJ38b%2FxyF7tKoSptEGVaRKPMXJ2DDPwv9Un1RFmVEqBSj7rstXfdVcia8AJiRh9zp5NQ%3D%3D";
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder;
		
		Statis statis = new Statis();
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
					int i = 0;
					i++;
					Element eElement = (Element) nNode;
					System.out.println("######################");
					System.out.println("no  : " + i);
					System.out.println("1  : " + getTagValue("kindCd", eElement));
					System.out.println("2  : " + getTagValue("processState", eElement));
					System.out.println("3  : " + getTagValue("orgNm", eElement));
					System.out.println("4  : " + getTagValue("careAddr", eElement));
					System.out.println("5 : " + getTagValue("happenDt", eElement));
					System.out.println("6  : " + getTagValue("filename", eElement));
					statis.setKind(getTagValue("kindCd", eElement));
					statis.setState(getTagValue("processState", eElement));
					statis.setOrg(getTagValue("orgNm", eElement));
					statis.setCareAddr(getTagValue("careAddr", eElement));
					statis.setHappenDay(getTagValue("happenDt", eElement));
					statis.setFileName(getTagValue("filename", eElement));
					int result = statisService.insertXml(statis);
					System.out.println( result > 0 ? "성공" : "실패");
					
				}	// for end
			}	// if end
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "statistics/statis";
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


}
