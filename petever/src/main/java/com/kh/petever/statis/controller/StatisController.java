package com.kh.petever.statis.controller;

import java.text.DecimalFormat;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
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
	@Autowired
	private StatisService statisService;
	
	@PostMapping("/statisXml.do")
//	@RequestMapping(value="/statis.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String statisXml(Statis statis) {
		String serviceKey = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20170101&endde=20181231&pageNo=3&numOfRows=100000&ServiceKey=8K6TziMrpfFbxxnak21vb%2B1P77px04rGI6I5hJxhxlzk2pcZzthYznTc9ZfSOox93LUNH3Z1PbMaF%2FVk62rUjQ%3D%3D";
		
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
					System.out.println("1  : " + getTagValue("kindCd", eElement));
					System.out.println("2  : " + getTagValue("processState", eElement));
					System.out.println("3  : " + getTagValue("orgNm", eElement));
					System.out.println("4  : " + getTagValue("careAddr", eElement));
					System.out.println("5  : " + getTagValue("happenDt", eElement));
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
	public ModelAndView statis(ModelAndView mav) {
		DecimalFormat df = new DecimalFormat("###,###");
		int cnt = statisService.countStatis();
		System.out.println(cnt);
		try {
			Statis statis = statisService.selectStatis();
			System.out.println(statis);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("cnt",df.format(cnt));
		mav.setViewName("statis/statis");
		return mav;
	}
	
	
}
