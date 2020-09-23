package com.kh.petever.shelterBoard;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.xml.sax.SAXException;

import com.kh.petever.common.XmlParserUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shelterBoard")
@Slf4j
public class ShelterBoard {
	
	@GetMapping("/shelterBoard.do")
	public String shelterBoard(Model model) {
		RestTemplate template = new RestTemplate();
		String serviceKey = "0oxoWLIMN%2BGCfVq7BsLiAFpHnGopa6SVnMkjsPVZ8zGyPBR89l2H%2FRpS6IvjnMDLpYFxpmFjBzhWbDJg4fj6LA%3D%3D";
		String address = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido?ServiceKey=";
		
		URI uri = null;
		try {
			uri = new URI(address + serviceKey);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		String obj = template.getForObject(uri, String.class);
				
		try {
			model.addAttribute("sidoMap", XmlParserUtil.XmlToMap(obj));
			System.out.println(XmlParserUtil.XmlToMap(obj));
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
//		log.debug(obj);
		
		return "shelterBoard/shelterBoard";
	}

}
