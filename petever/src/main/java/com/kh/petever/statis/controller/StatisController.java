package com.kh.petever.statis.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.petever.shelterBoard.model.vo.ShelterAnimal;
import com.kh.petever.statis.model.service.StatisService;
import com.kh.petever.statis.model.vo.StatisList;

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

	@SuppressWarnings("null")
	@GetMapping("/searchStatis.do")
	@ResponseBody
	public Map<String, int[]> searchStatis(
			@RequestParam(value="city", required=false) String city,
			@RequestParam(value="province", required=false) String province,
			@RequestParam(value="startDay", required=false) String startDay,
			@RequestParam(value="endDay", required=false) String endDay,
			@RequestParam(value="paramArea", required=false) String[] paramArea){
		Map<String, int[]> map = new HashMap<>();
		Map<String, String> search = new HashMap<>();
		int[] adoptData = new int[35];
		int[] euthanasiaData = new int[35];
		String searchCity = city;
		if(city.length()==4){
			char cityChar1 = city.charAt(0);
			char cityChar2 = city.charAt(2);
			city=cityChar1+""+cityChar2;
		}else {
			city = city.substring(0, 2);
		}
		province = province.substring(0, 2);
		String[] areaArrPer = paramArea;
		for(int p=0; p<paramArea.length;p++) {
			paramArea[p] = paramArea[p].substring(paramArea[p].indexOf("\"")+1, paramArea[p].lastIndexOf("\""));
			if(city.equals(searchCity)) {
				areaArrPer[p] = "%"+paramArea[p]+"%";
			}else {
				areaArrPer[p] = "%"+searchCity+" "+paramArea[p]+"%";  
			}
		}
		List<String> areaArr = new ArrayList<>(Arrays.asList(areaArrPer));
		List<StatisList> euthanasia = statisService.euthanasiaSearch(areaArr);
		List<StatisList> adopt = statisService.adoptStatisSearch(areaArr);

		for(int i =0; i<areaArrPer.length;i++) {
			areaArrPer[i] = areaArrPer[i].substring(areaArrPer[i].indexOf("%")+1, areaArrPer[i].lastIndexOf("%"));
			for(int j =0;j<euthanasia.size();j++) {
				if(areaArrPer[i].equals(euthanasia.get(j).getState())) {
					euthanasiaData[i] = euthanasia.get(j).getCnt();
				}
				if(areaArrPer[i].equals(adopt.get(j).getState())){
					adoptData[i] = adopt.get(j).getCnt();
				}
			}
		}
		
		search.put("city", "%"+city+"-"+province+"%");
		search.put("startDay", startDay);
		search.put("endDay", endDay);
		
		List<StatisList> list = statisService.selectList(search);
		int[] areaResult = new int[8];
		for (StatisList statisList : list) {
			areaResult[0]+=statisList.getCnt();
		}
			areaResult[1] = listGetCnt(list, 0);
			areaResult[7] = listGetCnt(list,1); 
			areaResult[3] = listGetCnt(list,2); 
			areaResult[6] = listGetCnt(list,3);
			areaResult[5] = listGetCnt(list,4);
			areaResult[2] = listGetCnt(list,5); 
			areaResult[4] = listGetCnt(list,6); 
		map.put("areaResult", areaResult);

		map.put("euthanasia", euthanasiaData);
		map.put("adopt", adoptData);

		return map;
	}
	
	@GetMapping("/statis.do")
	public ModelAndView statis(ModelAndView mav) {

		mav.setViewName("statis/statis");
		return mav;
	}
	
	@GetMapping("/loadStatis.do")
	@ResponseBody
	public Map<String, int[]> loadStatis() {
		Map<String, int[]> map = new HashMap<>();
		String[] area = {"%서울%", "%경기%", "%인천%", "%강원%", "%충청남도%", "%충청북도%", "%경상북도%", "%경상남도%", "%전라남도%", "%전라북도%", "%제주%"};
		List<String> areaArr = new ArrayList<>(Arrays.asList(area));
		int[] adoptData = new int[11];
		int[] euthanasiaData = new int[11];
		List<StatisList> euthanasia = statisService.euthanasia(areaArr);
		List<StatisList> adopt = statisService.adoptStatis(areaArr);
		String[] order = {"서울특", "경기도", "인천광", "강원도", "충청남", "충청북", "경상북", "경상남", "전라남", "전라북", "제주특"};
		for(int i =0; i<order.length;i++) {
			for(int j =0;j<euthanasia.size();j++) {
				if(order[i].equals(euthanasia.get(j).getState())) {
					euthanasiaData[i] = euthanasia.get(j).getCnt();
				}
				if(order[i].equals(adopt.get(j).getState())){
					adoptData[i] = adopt.get(j).getCnt();
				}
			}
		}
		
		List<StatisList> list = statisService.selectList();
		int[] loadResult = new int[8];
		for (StatisList statisList : list) {
			loadResult[0]+=statisList.getCnt();
		}
			loadResult[1] = listGetCnt(list, 0);
			loadResult[2] = listGetCnt(list,5); 
			loadResult[3] = listGetCnt(list,2); 
			loadResult[4] = listGetCnt(list,6);
			loadResult[5] = listGetCnt(list,4);
			loadResult[6] = listGetCnt(list,3); 
			loadResult[7] = listGetCnt(list,1); 
		map.put("loadResult", loadResult);
		
		map.put("euthanasia", euthanasiaData);
		map.put("adopt", adoptData);

		return map;
	}
	
	@SuppressWarnings("unused")
	public int listGetCnt(List<StatisList> list, int i) {
		String[] state = {"보호중", "종료(기증)", "종료(반환)", "종료(방사)", "종료(안락사)", "종료(입양)", "종료(자연사)"};
		List<String> stateArr = new ArrayList<>(Arrays.asList(state));
			for(;i<stateArr.size();i++) {
				for(int j =0;j<list.size();j++) {
				if(list.get(j).getState().contains(stateArr.get(i))) {
					return list.get(j).getCnt();
				}
			}
			return 0;
		}
		return 0;
	}
	
}
