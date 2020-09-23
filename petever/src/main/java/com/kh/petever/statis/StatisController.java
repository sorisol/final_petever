package com.kh.petever.statis;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/statis")
@Slf4j
public class StatisController {
	
	@GetMapping("/statis.do")
	public String shelterBoard() {
//		RestTemplate template = new RestTemplate();
		String serviceKey = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20140430&pageNo=1&numOfRows=1000&ServiceKey=qt%2F%2BL7Li2n81Q1cJHjhJ38b%2FxyF7tKoSptEGVaRKPMXJ2DDPwv9Un1RFmVEqBSj7rstXfdVcia8AJiRh9zp5NQ%3D%3D";
		
//		URI uri = null;
//		try {
//			uri = new URI(serviceKey);
//		} catch (URISyntaxException e) {
//			e.printStackTrace();
//		}
//		String obj = template.getForObject(uri, String.class);
//		System.out.println(obj);
//		try {
//			System.out.println(XmlParserUtil.XmlToMap(obj));
//		} catch (SAXException | IOException | ParserConfigurationException e) {
//			e.printStackTrace();
//		}
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
					System.out.println("1  : " + getTagValue("processState", eElement));
//					System.out.println("1  : " + getTagValue("age", eElement));
//					System.out.println("2  : " + getTagValue("careAddr", eElement));
//					System.out.println("3 : " + getTagValue("careNm", eElement));
//					System.out.println("4  : " + getTagValue("careTel", eElement));
//					System.out.println("5 : " + getTagValue("chargeNm", eElement));
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
