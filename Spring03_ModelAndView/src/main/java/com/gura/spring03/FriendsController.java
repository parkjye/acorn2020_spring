package com.gura.spring03;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FriendsController {
	
	@RequestMapping("/friends")
	public String friends(HttpServletRequest request) {
		
		//model (=data)
		List<String> list = new ArrayList<String>();
		
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		
		//view페이지에 전달할 모델을 request 영역에 담고
		request.setAttribute("friendsList", list);
		
		//view페이지로 forward 이동해서 응답한다.
		return "friends";
	}
	
	
	@RequestMapping("/friends2")
	public ModelAndView friends2() {
		
		//비즈니스 로직 수행 결과 모델
		List<String> list = new ArrayList<String>();
		
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		
		//Model과 view page 정보를 함께 담을 수 있는 ModelAndView 객체 생성
		ModelAndView mView = new ModelAndView();
		
		//request영역에 담을 내용을 .addObject() 메소드를 이용해서 담는다.
		mView.addObject("friendsList", list);		
		
		//view page정보(views폴더 내의 friends.jsp를 말하는 것)를 .setViewName() 메소드를 이용해서 전달한다.
		mView.setViewName("friends"); //근데 이거 왜 쓰는거지...?
		
		//Model과 view page 정보를 모두 가지고 있는 ModelAndView 객체를 리턴한다.
		return mView;
	}
	
	//ModelAndView 객체가 필요하다면, 메소드의 인자로 선언해서 참조값을 전달하면 된다.
	@RequestMapping("/friends3")
	public ModelAndView friends3(ModelAndView mView) {
		
		//비즈니스 로직 수행 결과 모델
		List<String> list = new ArrayList<String>();
		
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		
		//request영역에 담을 내용을 .addObject() 메소드를 이용해서 담는다.
		mView.addObject("friendsList", list);		
		
		//view page정보(views폴더 내의 friends.jsp를 말하는 것)를 .setViewName() 메소드를 이용해서 전달한다.
		mView.setViewName("friends");
		
		//Model과 view page 정보를 모두 가지고 있는 ModelAndView 객체를 리턴한다.
		return mView;
	}
	
	@RequestMapping("/delete")
	public String delete() {
		
		//가상의 삭제 비즈니스 로직 수행
		System.out.println("친구 정보를 삭제합니다.");
		
		//삭제 후 친구 목록 보기로 리다이렉트 이동
		// redirect: 붙히면 redirectt 없으면 forward이동
		return "redirect:/friends.do";
	}
	
	@RequestMapping("/delete2")
	public ModelAndView delete2(ModelAndView mView) {
		
		//가상의 삭제 비즈니스 로직 수행
		System.out.println("두번째 친구 정보를 삭제합니다.");
		
		//ModelAndView객체에 리다이렉트 이동 정보를 담아서
		mView.setViewName("redirect:/friends.do");
		
		//리턴한다.
		return mView;
	}
}


