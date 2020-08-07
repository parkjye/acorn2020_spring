package com.gura.spring03;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * component scan을 했을 때 HomeController 객체가 생성이 되고 spring이 관리한다.
 * spring이 관리 한다는 의미는 spring bean 컨테이너에서 관리되는 객체가 된다는 의미이다. 
 */
@Controller
public class HomeController {
	
	/**
	 * "/home.do" 요청이 왔을 때 이 메소드로 요청을 처리하게 된다.
	 */
	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		
		//공지사항 목록이라고 가정하자. (==data는 model이라고 한다.
		List<String> noticeList = new ArrayList<String>();
		noticeList.add("비온다");
		noticeList.add("장마철이네요");
		noticeList.add("집에 어떻게 가지");
		
		request.setAttribute("noticeList", noticeList);
				
		/**
		 * view page로 forward이동해서 응답하기
		 * redirect 이동하면 request 영역에 담은 내용은 삭제된다.
		 * 
		 * 리턴하는 문자열은 view 페이지의 위치를 알려주는 것이다.
		 * "/WEB-INF/views/"+"home"+".jsp" (==view page라고도 한다)
		 * */
		return "home";
	}
	
}
