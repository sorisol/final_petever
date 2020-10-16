package com.kh.petever.shelterInfoBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.kh.petever.shelterInfoBoard.model.service.ShelterInfoBoardService;
import com.kh.petever.shelterInfoBoard.model.vo.ShelterInfoBoard;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/shelterInfoBoard")
@Slf4j
public class ShelterInfoBoardController {
	
	@Autowired
	private ShelterInfoBoardService shelterInfoBoardService;
	
	
	@RequestMapping("/shelterInfoBoard.do")
	public ModelAndView shelterInfoXml(ShelterInfoBoard shelterInfoBoard) throws ParserConfigurationException, SAXException, IOException {
		
		ModelAndView mv = new ModelAndView("shelterInfoBoard/shelterInfoBoard");
		return mv;
		
	}
	
	
	
	@RequestMapping("/shelterInfoBoardList.do")
	@ResponseBody
	//public ModelAndView getShelterInfo(String pageNo, HttpServletRequest request, HttpServletRequest response) throws Exception {
	public Map<String, Object> getShelterInfo(int start, HttpServletRequest request, HttpServletRequest response) throws Exception {
		
		int pageNo = start/10 + 1; 
		
		String url = "http://openapi.animal.go.kr/openapi/service/rest/animalShelterSrvc/shelterInfo?ServiceKey=sHkvTXNVEH0xM8NzD9AZeKxj%2BKfxwxlJMK8Kb8RXUn7n4YWFgloxntevGikdJW00UKK5MjFHe83BRPalMs4D0w%3D%3D&care_reg_no=&care_nm="
				+ "&pageNo="+pageNo;
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		//root tag
		doc.getDocumentElement().normalize();
//		System.out.println("Root element : " + doc.getDocumentElement().getNodeName());

		// tag
		NodeList nList = doc.getElementsByTagName("item");
		
		int totalCount = Integer.parseInt(doc.getElementsByTagName("totalCount").item(0).getChildNodes().item(0).getNodeValue());
		
		List<ShelterInfoBoard> shelterInfoBoardList = new ArrayList<ShelterInfoBoard>();
		
		for(int temp=0; temp < nList.getLength();temp++) {
			
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					ShelterInfoBoard vo = new ShelterInfoBoard();
					
					Element eElement = (Element) nNode;
					vo.setOrgNm(getTagValue("orgNm", eElement));
					vo.setCareAddr(getTagValue("careAddr", eElement));
					vo.setCareNm(getTagValue("careNm", eElement));
					vo.setCareTel(getTagValue("careTel", eElement));
//					vo.setRnum(Integer.parseInt(getTagValue("rnum", eElement)));
//					System.out.println(vo.toString());
					
					shelterInfoBoardList.add(vo);
				}//if end
			} // for end
	    
	    Map<String, Object> result = new HashMap<>();
	    result.put("data", shelterInfoBoardList);
	    result.put("recordsTotal", totalCount);
	    result.put("recordsFiltered", totalCount);
	    
		return result;

	}
	

	@RequestMapping("/shelterInfoBoardDetail.do")
	
	
	
	
    private String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if(nValue == null)
			return null;
    	return nValue.getNodeValue();
	}


}
