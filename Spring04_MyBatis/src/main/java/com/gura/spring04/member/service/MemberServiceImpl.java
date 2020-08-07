package com.gura.spring04.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.member.dao.MemberDao;
import com.gura.spring04.member.dto.MemberDto;

/*
 * 비즈니스 로직을 처리할 서비스 클래스 정의하기
 * @Service
 * 
 * 의존관계를 느슨하게 하기 위해서 인터페이스를 구현한 것.
 * */

//bean이 되도록 @Service 어노테이션을 붙힌다.
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Override
	public void addMember(MemberDto dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void deleteMember(int num) {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	//한 명의 회원정보를 불러와서 ModelAndView 객체에 담아주는 비즈니스 로직 처리
	@Override
	public void getMember(int num, ModelAndView mView) {
		// TODO Auto-generated method stub
		MemberDto dto = dao.getData(num);
		mView.addObject("dto", dto);
	}

	//회원 목록을 불러와서 ModelAndView 객체에 담아주는 비즈니스 로직처리
	@Override
	public void getListMember(ModelAndView mView) {
		// TODO Auto-generated method stub
		List<MemberDto> list = dao.getList();
		mView.addObject("list", list);
	}

}
