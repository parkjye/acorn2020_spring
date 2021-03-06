package com.gura.spring02;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//컨트롤러 만들 때 사용하는 어노테이션, Spring Framwork에서 제공한다.
@Controller
public class HomeController {
	
	//해당 메소드가 어떤 요청을 처리할지 결정하는 어노테이션
	@RequestMapping("/home.nhn") //.nhn 생략 가능하다.
	public String home() {
		
		// forward 이동될 jsp 페이지의 위치를 리턴해준다.
		// "/WEB-INF/views" + "home" + ".jsp"
		return "home";
	}
	
}
