package com.kh.petever.check.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.petever.check.model.service.CheckService;
import com.kh.petever.check.model.vo.AnimalView;

@Controller
@RequestMapping("/check")
public class CheckController {

	@Autowired
	private CheckService checkService;
	
	@GetMapping("/check.do")
	public String check() {
		
		return "check/check"; 
	}
	
	@GetMapping("/checkTotal.do")
	public ModelAndView checkTotal(@RequestParam(value="total", required=false) String total,
									@RequestParam(value="breeds", required=false) String breeds,
									ModelAndView mav) {
		System.out.println(total);
		System.out.println(breeds);
		String[] dog = new String[3];
		String[] dogEx = new String[3];
		String[] dogImg = new String[3];
		String hair = breeds.substring(0,1);
		String weight = breeds.substring(1,2);
		String act = breeds.substring(2);

		switch(breeds) {
		case "aaa" :  
			dog[0]="말티즈";
			dog[1]="퍼그";
			dog[2]="바셋 하운드";
			dogEx[0]="■ 수명<br/>12–15년\n<br />" + 
					"■ 색상<br/>백색\r\n<br />" + 
					"■ 성격<br/>유순한, 온순한, 애정이 풍부한, 생기있는, 총명한, 반응이 빠른, 상냥한, 겁이 없는, 장난스러운, 활동적인, 온화한\r\n<br />" + 
					"■ 체중<br/>수컷: 3–4킬로그램, 암컷: 3–4킬로그램\r\n<br />" + 
					"■ 높이<br/>수컷: 21–25 센티미터, 암컷: 20–23 센티미터";
			dogEx[1]="■ 수명<br/>12–15년\r\n<br />" + 
					"■ 성격<br/>유순한, 매력적인, 영리한, 고집스러운, 사교성 좋은, 장난스러운, 조용한, 주의 깊은\r\n<br />" + 
					"■ 크기/높이<br/>수컷: 30cm (어깨 높이), 암컷: 25cm (어깨 높이)\r\n<br />" + 
					"■ 색상<br/>검정, 판, 살구색, Silver Fawn";
			dogEx[2]="■ 수명<br/>10–12년\r\n<br />" + 
					"■ 성격<br/>집요한, 헌신적인, 애정이 풍부한, 상냥한, 우호적인, 온화한\r\n<br />" + 
					"■ 색상<br/>Lemon & White, Tri-color, 블랙앤화이트, White & Chocolate, Black & Brown, Red & White\r\n<br />" + 
					"■ 체중<br/>암컷: 20–27킬로그램, 수컷: 23–29킬로그램\r\n<br />" + 
					"■ 높이<br/>암컷: 28–36 센티미터, 수컷: 30–38 센티미터";
			dogImg[0]="maltese.jpg";
			dogImg[1]="pug.jpg";
			dogImg[2]="baset.jpg";
			break;
		case "aba" :  
			dog[0]="바센지";
			dog[1]="프렌치 불독";
			dog[2]="보스턴 테리어";
			dogEx[0]="■ 수명<br/>12–16년\r\n<br />" + 
					"■ 성격<br/>애정이 풍부한, 에너제틱한, 총명한, 호기심이 많은, 장난스러운, 경계심이 많은\r\n<br />" + 
					"■ 높이<br/>수컷: 41–43 센티미터, 암컷: 38–41 센티미터\r\n<br />" + 
					"■ 색상<br/>검정, 브린들, Tri-color, 탠, 블랙앤화이트, 적색\r\n<br />" + 
					"■ 체중<br/>수컷: 10–12킬로그램, 암컷: 9–11킬로그램";
			dogEx[1]="■ 수명<br/>10–14년\r\n<br />" + 
					"■ 성격<br/>온순한, 애정이 풍부한, 생기있는, 사교성 좋은, 감각이 예민한, 인내심 있는, 장난스러운, 활발한, 경계심이 많은, 탄탄한\r\n<br />" + 
					"■ 색상<br/>브린들, 백색, 판, 황갈색, Brindle & White\r\n<br />"; 
			dogEx[2]="■ 수명<br/>13–15년\r\n<br />" + 
					"■ 무게<br/>4.5 – 11kg\r\n<br />" + 
					"■ 크기/높이<br/>38 – 43cm (어깨 높이)\r\n<br />" + 
					"■ 성격<br/>생기있는, 총명한, 우호적인\r\n<br />" + 
					"■ 색상<br/>블랙앤화이트, Brindle & White, Seal & White";
			dogImg[0]="basenji.jpg";
			dogImg[1]="french.jpg";
			dogImg[2]="boston.jpg";
			break;
		case "aca" :  
			dog[0]="로트바일러";
			dog[1]="아키다";
			dog[2]="그레이 하운드";
			dogEx[0]="■ 수명<br/>8–10년\r\n<br />" + 
					"■ 성격<br/>성격이 좋은, 헌신적인, 자신감이 있는, 순종적인, 얌전한, 겁이 없는, 경계심이 많은, 자신감에 차있는, 느긋한, 용맹스러운\r\n<br />" + 
					"■ 높이<br/>암컷: 56–63 센티미터, 수컷: 61–69 센티미터\r\n<br />" + 
					"■ 체중<br/>암컷: 35–48킬로그램, 수컷: 50–60킬로그램\r\n<br />" + 
					"■ 색상<br/>검정, 황갈색, Mahogany";
			dogEx[1]="■ 수명<br/>10–12년\r\n<br />" + 
					"■ 성격<br/>유순한, Composed, Receptive, 충실한\r\n<br />" + 
					"■ 높이<br/>암컷: 58–64 센티미터, 수컷: 64–70 센티미터\r\n<br />" + 
					"■ 색상<br/>백색, 브린들, Sesame, 레드 폰\r\n<br />" + 
					"■ 체중<br/>암컷: 23–36킬로그램, 수컷: 27–41킬로그램";
			dogEx[2]="■ 수명<br/>10–14년\r\n<br />" + 
					"■ 성격<br/>애정이 풍부한, 총명한, 탄탄한, 조용한, 침착한, 온화한\r\n<br />" + 
					"■ 높이<br/>수컷: 71–76 센티미터, 암컷: 68–71 센티미터\r\n<br />" + 
					"■ 색상<br/>검정, 브린들, 백색, 판, 푸른색, 적색";
			dogImg[0]="lot.jpg";
			dogImg[1]="akita.jpg";
			dogImg[2]="gray.jpg";
			break;
		case "aab" :  
			dog[0]="미니어쳐 핀셔";
			dog[1]="닥스훈트";
			dog[2]="비글";
			dogEx[0]="■ 수명<br/>15년\r\n<br />" + 
					"■ 성격<br/>영리한, 에너제틱한, 반응이 빠른, 외향적인, 장난스러운, 우호적인\r\n<br />" + 
					"■ 높이<br/>수컷: 25–30 센티미터, 암컷: 25–28 센티미터\r\n<br />" + 
					"■ 색상<br/>Stag Red, Chocolate & Tan, Chocolate & Rust, Black & Rust, 흑갈색, 적색\r\n<br />" + 
					"■ 체중<br/>수컷: 4–5킬로그램, 암컷: 3.5–5킬로그램";
			dogEx[1]="■ 수명<br/>12–16년\r\n<br />" + 
					"무게<br/>7.3 – 15kg (표준 크기)\r\n<br />" + 
					"■ 성격<br/>영리한, 고집스러운, 헌신적인, 생기있는, 장난스러운, 용맹스러운\r\n<br />" + 
					"■ 색상<br/>검정, 흑갈색, Chocolate & Cream, Chocolate & Tan, 크림색, 탠, 블루 탄, 적색";
			dogEx[2]="■ 수명<br/>12–15년\r\n<br />" + 
					"■ 성격<br/>쾌활한, 쉽게 흥분하는, 총명한, 결연한, 침착한, 온화한\r\n<br />" + 
					"■ 색상<br/>Lemon & White, White & Tan, Chocolate Tri, Tri-color, White & Chocolate, Orange & White, Red & White\r\n<br />" + 
					"■ 높이<br/>수컷: 36–41 센티미터, 암컷: 33–38 센티미터\r\n<br />" + 
					"■ 체중<br/>수컷: 10–11킬로그램, 암컷: 9–10킬로그램"; 
			dogImg[0]="mini.jpg";
			dogImg[1]="docs.jpg";
			dogImg[2]="biggle.jpg";
			break;
		case "abb" :  
			dog[0]="웰시 코기 펨브로크";
			dog[1]="코카 스파니엘";
			dog[2]="샤페이";
			dogEx[0]="■ 수명<br/>펨브록 웰시 코기: 12 – 15년, 카디건 웰시 코기: 12 – 15년\r\n<br />" + 
					"■ 크기/높이<br/>펨브록 웰시 코기: 25 – 30cm, 카디건 웰시 코기: 26 – 32cm\r\n<br />" + 
					"■ 무게<br/>펨브록 웰시 코기: 12kg, 카디건 웰시 코기: 14 – 17kg";
			dogEx[1]="■ 수명<br/>잉글리시 코커 스패니얼: 11 – 12년\r\n<br />" + 
					"■ 크기/높이<br/>잉글리시 코커 스패니얼: 39 – 41cm, 아메리칸 코커 스패니얼: 34 – 39cm\r\n<br />" + 
					"■ 무게<br/>잉글리시 코커 스패니얼: 13 – 14kg, 아메리칸 코커 스패니얼: 11 – 14kg";
			dogEx[2]="■ 수명<br/>9–11년\r\n<br />" + 
					"■ 성격<br/>의심이 많은, 헌신적인, 애정이 풍부한, 조용한, 독립심이 강한, 애정이 넘치는\r\n<br />" + 
					"■ 높이<br/>암컷: 46–51 센티미터, 수컷: 46–51 센티미터\r\n<br />" + 
					"■ 체중<br/>암컷: 18–25킬로그램, 수컷: 25–30킬로그램\r\n<br />" + 
					"■ 색상<br/>검정, 판, Lilac, 크림색, Sand, 적색"; 
			dogImg[0]="cogi.jpg";
			dogImg[1]="koka.jpg";
			dogImg[2]="shapay.jpg";
			break;
		case "acb" :  
			dog[0]="라브라도 리트리버";
			dog[1]="허스키";
			dog[2]="케인 코르소";
			dogEx[0]="■ 수명<br/>10–12년\r\n<br />" + 
					"■ 성격<br/>부드러운, 총명한, 민첩한, 외향적인, Trusting, 침착한, 온화한\r\n<br />" + 
					"■ 높이<br/>수컷: 57–62 센티미터, 암컷: 55–60 센티미터\r\n<br />" + 
					"■ 색상<br/>검정, 초콜릿, 옐로우\r\n<br />" + 
					"■ 체중<br/>수컷: 29–36킬로그램, 암컷: 25–32킬로그램";
			dogEx[1]="■ 수명<br/>12–15년\r\n<br />" + 
					"■ 성격<br/>총명한, 외향적인, 경계심이 많은, 우호적인, 온화한\r\n<br />" + 
					"■ 색상<br/>백색, 검정, 흑갈색, Silver-gray, 블랙앤화이트, Sable & White, 회색, Gray & White, Red & White\r\n<br />" + 
					"■ 높이<br/>암컷: 50–56 센티미터, 수컷: 54–60 센티미터\r\n<br />" + 
					"■ 체중<br/>암컷: 16–23킬로그램, 수컷: 20–27킬로그램";
			dogEx[2]="■ 수명<br/>10–12년\r\n<br />" + 
					"■ 성격<br/>조용한, 차분한, 침착한, 훈련 능력이 뛰어난, 느긋한\r\n<br />" + 
					"■ 높이<br/>암컷: 58–66 센티미터, 수컷: 62–70 센티미터\r\n<br />" + 
					"■ 체중<br/>암컷: 40–45킬로그램, 수컷: 45–50킬로그램\r\n<br />" + 
					"■ 색상<br/>검정, Chestnut Brindle, 판, 회색, Black Brindle, 적색";
			dogImg[0]="labra.jpg";
			dogImg[1]="hus.jpg";
			dogImg[2]="kane.jpg";
			break;
		case "baa" :  
			dog[0]="포메라니안";
			dog[1]="치와와";
			dog[2]="요크셔 테리어";
			dogEx[0]="■ 수명<br/>12–16년\r\n<br />" + 
					"■ 무게<br/>1.9 – 3.5kg (성체)\r\n<br />" + 
					"■ 크기/ 높이<br/>20cm (성체)\r\n<br />" + 
					"■ 성격<br/>총명한, 사교성 좋은, 친근한, 장난스러운, 활동적인, 우호적인\r\n<br />" + 
					"■ 색상<br/>백색, 검정, Grey-shaded, 탠, 갈색, 오렌지\r\n<br />";
			dogEx[1]="■ 수명<br/>12–20년\r\n<br />" + 
					"■무게<br/>1.5 – 3kg\r\n<br />" + 
					"■ 크기/ 높이<br/>15 – 23cm\r\n<br />" + 
					"■ 성격<br/>헌신적인, 생기있는, 경계심이 많은, 용맹스러운, 민첩한\r\n<br />" + 
					"■ 색상<br/>검정, 백색, 판, 크림색, 초콜릿, 골드";
			dogEx[2]="■ 수명<br/>13–16년\r\n<br />" + 
					"■ 크기/ 높이<br/>수컷: 18 – 23cm (성체, 어깨 높이)\r\n<br />" + 
					"■ 성격<br/>대담한, 총명한, 독립심이 강한, 자신감에 차있는, 용맹스러운\r\n<br />" + 
					"■ 색상<br/>블루 탄, 검은 회색이 도는 청색, 흑갈색, 블랙 앤 골드";
			dogImg[0]="pome.jpg";
			dogImg[1]="chi.jpg";
			dogImg[2]="york.jpg";
			break;
		case "bba" :  
			dog[0]="코카 스파니엘";
			dog[1]="라사 압소";
			dog[2]="스피츠";
			dogEx[0]="■ 수명<br/>9–14년\r\n<br />" + 
					"■ 성격<br/>사교성 좋은, 애정이 풍부한, 인내심 있는, 겁이 없는, 장난스러운, Adaptable\r\n<br />" + 
					"■ 무게<br/>수컷: 5.9 – 8.2kg (성체), 암컷: 5.9 – 8.2kg (성체)\r\n<br />" + 
					"■ 크기/ 높이<br/>수컷: 30 – 33cm (성체), 암컷: 30 – 33cm (성체)\r\n<br />" + 
					"■ 색상<br/>흑갈색, Tri-color, Blenheim, Ruby";
			dogEx[1]="■ 수명<br/>12–14년\r\n<br />" + 
					"■ 성격<br/>헌신적인, 생기있는, 에너제틱한, 순종적인, 총명한, 얌전한, 활발한, 겁이 없는, Assertive, 장난스러운, 경계심이 많은, 우호적인\r\n<br />" + 
					"■ 체중<br/>암컷: 5–7킬로그램, 수컷: 6–8킬로그램\r\n<br />" + 
					"■ 높이<br/>암컷: 25–28 센티미터, 수컷: 25–28 센티미터\r\n<br />" + 
					"■ 색상<br/>검정, 백색, Dark Grizzle, Honey (Color), Sandy, 골든, 갈색";
			dogEx[2]="■ 수명<br/>10 – 16년\r\n<br />" + 
					"■ 색상<br/>백색\r\n<br />" + 
					"■ 성격<br/>애정이 풍부한, 순종적인, 총명한, 장난스러운, 붙임성이 있는, 위엄스러운\r\n<br />" + 
					"■ 크기/ 높이<br/>수컷: 30 – 38cm (어깨 높이), 암컷: 25 – 35cm";
			dogImg[0]="king.jpg";
			dogImg[1]="lhasa.jpg";
			dogImg[2]="spi.jpg";
			break;
		case "bca" :  
			dog[0]="뉴펀들랜드";
			dog[1]="그레이트 피레니즈";
			dog[2]="버니즈 마운틴 독";
			dogEx[0]="■ 수명<br/>8–10년\r\n<br />" + 
					"■ 성격<br/>상냥한, 온화한, 훈련 능력이 뛰어난\r\n<br />" + 
					"■ 높이<br/>수컷: 69–74 센티미터, 암컷: 63–69 센티미터\r\n<br />" + 
					"■ 체중<br/>수컷: 60–70킬로그램, 암컷: 45–55킬로그램\r\n<br />" + 
					"■ 색상<br/>검정, 블랙앤화이트, 회색, 갈색";
			dogEx[1]="■ 수명<br/>10–12년\r\n<br />" + 
					"■ 성격<br/>의지가 강한, 애정이 풍부한, 인내심 있는, 겁이 없는, 자신감에 차있는, 온화한\r\n<br />" + 
					"■ 높이<br/>수컷: 70–82 센티미터, 암컷: 65–74 센티미터\r\n<br />" + 
					"■ 체중<br/>수컷: 50–54킬로그램, 암컷: 36–41킬로그램\r\n<br />" + 
					"■ 색상<br/>백색, 탠, 회색, 적색, Badger";
			dogEx[2]="■ 수명<br/>6–8년\r\n<br />" + 
					"■ 색상<br/>Black tricolor\r\n<br />" + 
					"■ 성격<br/>애정이 풍부한, 총명한, 충성스러운, 충실한\r\n<br />" + 
					"■ 체중<br/>수컷: 38–50킬로그램, 암컷: 36–48킬로그램\r\n<br />" + 
					"■ 높이<br/>수컷: 64–70 센티미터, 암컷: 58–66 센티미터";
			dogImg[0]="new.jpg";
			dogImg[1]="grate.jpg";
			dogImg[2]="bm.jpg";
			break;
		case "bab" :  
			dog[0]="비숑 프리제";
			dog[1]="빠삐용";
			dog[2]="토이 푸들";
			dogEx[0]="■ 수명<br/>12–15년\r\n<br />" + 
					"■ 성격<br/>혈기왕성한, 애정이 풍부한, 명랑한, 장난스러운, 예민한, 온화한\r\n<br />" + 
					"■ 높이<br/>수컷: 23–30 센티미터, 암컷: 23–28 센티미터\r\n<br />" + 
					"■ 체중<br/>수컷: 3–5킬로그램, 암컷: 3–5킬로그램\r\n<br />" + 
					"■ 색상<br/>백색, 화이트 & 버프, White & Cream, White & Apricot";
			dogEx[1]="■ 수명<br/>13–15년\r\n<br />" + 
					"■ 성격<br/>에너제틱한, 총명한, 밝은, 경계심이 많은, 우호적인\r\n<br />" + 
					"■ 크기/ 높이<br/>암컷: 20 – 28cm (성체, 수컷), 수컷: 20 – 28cm (성체, 암컷)\r\n<br />" + 
					"■ 무게<br/>수컷: 3.6 – 4.5kg (성체), 암컷: 3.2 – 4.1kg (성체)\r\n<br />" + 
					"■ 색상<br/>백색, White & Chocolate, Fawn & White, 검은 담비색, 블랙앤화이트, Red & White";
			dogEx[2]="■ 수명<br/>12–15년\r\n<br />" + 
					"■ 크기/ 높이<br/>토이 푸들: 24 – 28cm, 미니어처 푸들: 28 – 35cm, 스탠다드 푸들: 45 – 60cm, 미디엄 푸들: 35 – 45cm\r\n<br />" + 
					"■ 성격<br/>총명한, 경계심이 많은, 활동적인, 충실한, 본능적인, 훈련 능력이 뛰어난\r\n<br />" + 
					"■ 색상<br/>검정, 백색, 살구색, 크림색, 검은 담비색, 블랙앤화이트, 푸른색, 회색, 은빛, 갈색, 적색";
			dogImg[0]="bs.jpg";
			dogImg[1]="papi.jpg";
			dogImg[2]="toy.jpg";
			break;
		case "bbb" :  
			dog[0]="슈나우져";
			dog[1]="셔틀랜드 쉽독";
			dog[2]="보더 콜리";
			dogEx[0]="■ 수명<br/>미니어처 슈나우저: 12 – 14년, 자이언트 슈나우저: 10 – 12년, 스탠더드 슈나우저: 13 – 16년\r\n<br />" + 
					"■ 크기/ 높이<br/>미니어처 슈나우저: 30 – 36cm, 자이언트 슈나우저: 65 – 70cm, 스탠더드 슈나우저: 47 – 50cm\r\n<br />" + 
					"■ 무게<br/>미니어처 슈나우저: 5 – 8.2kg, 자이언트 슈나우저: 34 – 43kg, 스탠더드 슈나우저: 14 – 20kg";
			dogEx[1]="■ 수명 범위<br/>12-14년"
					+ "■ 체중 <br/>암수 6 - 9kg 어깨까지의  높이 수컷40cm 암컷35cm"
					+ "■ 활동량<br/>매우 활동적 / 운동 요구량(20-40분/일)";
			dogEx[2]="■ 수명<br/>10–17년\r\n<br />" + 
					"■ 성격<br/>집요한, 에너제틱한, 총명한, 반응이 빠른, 감각이 예민한, 경계심이 많은\r\n<br />" + 
					"■ 색상<br/>검정, 백색, 파랑, 블루 멀, 옅은 자색, 브린들, 레드멀, 초콜릿, 리버색, 세이블 멀, 골드, 적색\r\n<br />" + 
					"■ 높이<br/>수컷: 48–56 센티미터, 암컷: 46–53 센티미터\r\n<br />" + 
					"■ 체중<br/>수컷: 14–20킬로그램, 암컷: 12–19킬로그램\r\n<br />";
			dogImg[0]="shu.jpg";
			dogImg[1]="ship.jpg";
			dogImg[2]="border.jpg";
			break;
		case "bcb" :  
			dog[0]="골든 리트리버";
			dog[1]="사모예드";
			dog[2]="스탠다드 푸들";
			dogEx[0]="■ 수명<br/>10–12년\r\n<br />" + 
					"■ 성격<br> 부드러운, 총명한, 믿음직한, 신뢰할 만한, 자신감에 차있는, 우호적인\r\n<br />" + 
					"■ 높이<br/>암컷: 51–56 센티미터, 수컷: 56–61 센티미터\r\n<br />" + 
					"■ 체중<br/>암컷: 25–32킬로그램, 수컷: 30–34킬로그램\r\n<br />" + 
					"■ 색상<br/>다크골든, 크림색, 밝은 금색, 골든\r\n<br />"; 
			dogEx[1]="■ 수명<br/>12–14년\r\n<br />" + 
					"■ 성격<br/>생기있는, 고집스러운, 사교성 좋은, 장난스러운, 경계심이 많은, 우호적인\r\n<br />" + 
					"■ 높이<br/>암컷: 48–53 센티미터, 수컷: 53–60 센티미터\r\n<br />" + 
					"■ 체중<br/>암컷: 16–20킬로그램, 수컷: 20–30킬로그램\r\n<br />" + 
					"■ 색상<br/>백색, White & Biscuit, 크림색";
			dogEx[2]="■ 크기/ 높이<br/>45 – 60cm (성체, 어깨 높이)\r\n<br />" + 
					"■ 수명<br/>12 – 15년\r\n";
			dogImg[0]="golden.jpg";
			dogImg[1]="shamo.jpg";
			dogImg[2]="standard.jpg";
			break;
		}
		
		String money = "";
		String weightMent = "";
		String actMent = "";
		switch(act) {
		case "a": actMent="활발한 강아지"; break;
		case "b": actMent="점잖은 강아지"; break;
		}
		switch(weight) {
		case "a": money="3~4";
			weightMent="나만의 귀엽고 "+actMent;
			break;
		case "b": money="10~11";
			weightMent="나의 소중하고 친구같은 "+actMent;
		break;
		case "c": money="25~30";
			weightMent="듬직하고 보디가드같은 "+actMent;
		break;
		}
		
		AnimalView av = checkService.selectOne(keyword(dog[0]));
		AnimalView av1 = checkService.selectOne(keyword(dog[1]));
		AnimalView av2 = checkService.selectOne(keyword(dog[2]));
		mav.addObject("av",av);
		mav.addObject("av1",av1);
		mav.addObject("av2",av2);
		mav.addObject("weightMent",weightMent);
		mav.addObject("money",money);
		mav.addObject("dog",dog);
		mav.addObject("dogEx",dogEx);
		mav.addObject("dogImg",dogImg);
		mav.addObject("total",total);
		mav.setViewName("check/checkTotal");
		return mav; 
	}
	
	public String keyword(String dog) {
		dog = "[개] "+dog;
		return dog;
	}
	
}
