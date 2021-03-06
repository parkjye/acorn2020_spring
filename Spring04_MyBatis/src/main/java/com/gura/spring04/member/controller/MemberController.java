package com.gura.spring04.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.member.dto.MemberDto;
import com.gura.spring04.member.service.MemberService;

@Controller
public class MemberController {
	
	//의존객체를 주입 받는다.
	//비즈니스 로직은 service에서 처리하기 때문.
	@Autowired
	private MemberService service;
	
	//POST 방식 /member/update 요청처리
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDto dto) {
		
		service.updateMember(dto);
		
		return "member/update";
	}
	
	//GET방식 /member/updateform 요청처리
	@RequestMapping(value = "/member/updateform", method = RequestMethod.GET)
	public ModelAndView updateform(@RequestParam int num, ModelAndView mView) {
		
		service.getMember(num, mView);
		
		//view 페이지 정보를 ModelAndView 객체에 담는다.
		mView.setViewName("member/updateform");
		
		//ModelAndView 객체를 리턴해준다.
		return mView;
	}
	
	//회원 삭제 요청 처리
	@RequestMapping("/member/delete")
	public String delete(@RequestParam int num) {
		service.deleteMember(num);
		
		//리다이렉트 응답
		return "redirect:/member/list.do";
	}
	
	//회원 추가 요청처리
	@RequestMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto) {
		
		//회원 정보를 DB에 저장하고
		service.addMember(dto);
		
		//view page로 forward 이동해서 응답
		return "member/insert";
	}
	
	
	//회원 추가 폼 요청 처리
	@RequestMapping("/member/insertform")
	public String insertform() {
		//현재 수행할 비즈니스 로직은 없다.
		
		return "member/insertform";
	}
	
	//회원 목록 불러오기
	@RequestMapping("/member/list")
	public ModelAndView list(ModelAndView mView) {	
		
		//회원목록을 얻어온다.
		service.getListMember(mView);
		
		//view 페이지 정보를 담고(forward이동)
		mView.setViewName("member/list");
		
		//ModelAndView 객체를 리턴해준다.
		return mView;
	}
	
}
