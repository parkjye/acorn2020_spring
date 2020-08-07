package com.gura.spring04.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring04.member.dto.MemberDto;

/*
 * @Repository = Data의 저장소
 * dao를 bean으로 만들기 위한 어노테이션 (bean은 스프링이 관리하는 객체이다.)
 * 스프링이 관리하는 객체를 만들기 위한 어노테이션
 * */
@Repository
public class MemberDaoImpl implements MemberDao{

	//의존 객체 주입 받기(Dependency Injection)
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(MemberDto dto) {
		// TODO Auto-generated method stub
		session.insert("member.insert", dto);
		/*
		 * mapper namespace : member
		 * sql id : insert
		 * parameterType : MemberDto 
		 * */
		
	}

	@Override
	public void update(MemberDto dto) {
		// TODO Auto-generated method stub
		session.update("member.update", dto);
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		session.delete("member.delete", num);
		/*
		 * mapper namespace : member
		 * sql id : delete
		 * parameterType : int or java.lang.Integer 
		 * */
	}

	@Override
	public MemberDto getDate(int num) {
		MemberDto dto = session.selectOne("member.getDate", num);
		/*
		 * select는 수행 후 결과 값을 가져와야한다.
		 * select의 결과는 row로 나타난다.
		 * 결과가 한 개의 row인 경우, 여러개의 row인 경우를 판단해야한다.
		 * 
		 * mapper namespace : member
		 * sql id : getData
		 * parameterType : int
		 * resultType : MemberDto
		 * -- resultType은 select된 결과row 한 개를 담을 data Type을 의미한다.
		 * -- select한 결과를 MemberDto에 담아서 return한다. (메소드 return type이 MemberDto)
		 * */
		return dto;
	}

	@Override
	public List<MemberDto> getList() {
		List<MemberDto> list = session.selectList("member.getList");
		/*
		 * resultType : memberDto
		 * -- resultType은 select된 row 하나를 담을 데이터 type을 의미한다.
		 * -- selectList() 메소드는 List type을 리턴한다.
		 * -- List의 generic type이 resultType이 된다.
		 * */
		
		return list;
	}

}
