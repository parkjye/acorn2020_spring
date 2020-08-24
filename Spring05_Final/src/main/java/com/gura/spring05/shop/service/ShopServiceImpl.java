package com.gura.spring05.shop.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.shop.dao.OrderDao;
import com.gura.spring05.shop.dao.ShopDao;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired private ShopDao shopDao;
	@Autowired private OrderDao	orderDao;
	
	@Override
	public void getList(ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}

	/*
	 * [ Transaction(트랜젝션)이란 ]
	 * 		2개 이상의 쿼리를 하나로 묶어서 DB에 전송하는데,
	 * 		이 과정에서 exception이 발생하면 진행했던 과정을 원래대로 되돌려 놓는다.
	 * 
	 * 
	 * [ Spring 트랜젝션 설정 방법 ]
	 * 
	 * 1. pom.xml에 spring-tx dependency 추가
	 * 2. servlet-context.xml에 transaction 설정 추가
	 * 3. 트랜젝션을 관리할 서비스의 메소드에 @Transactional 어노테이션 붙히기
	 * 
	 * 
	 * [ 프로그래머의 의도하에 트랜젝션에 영향을 주는 Exception을 발생 시키는 방법 ]
	 * 
	 * 1. DataAccessException 클래스를 상속받은 클래스를 정의하고
	 * 		Ex) class MyException extends DataAccessException{ }
	 * 				throw new MyException("예외 메세지");
	 * 
	 * 2. 예외를 발생시킬 조건이라면 위와 같이 예외를 발생시켜 트랜젝션이 관리 되로록 한다.
	 * 
	 * */
	@Transactional
	@Override
	public void buy(HttpServletRequest request, ModelAndView mView) {
		/*
		 * select - update - update - update - insert
		 * update부터 insert까지 트랜젝션(Transaction)으로 묶는다.
		 * */
		
		// 1. 구입할 상품의 번호를 읽어온다.
		
		// 2. 상품의 가격을 읽어온다.
		
		// 3. 상품의 가격만큼 계좌 잔액을 줄인다.
		
		// 4. 가격의 10%를 포인트로 적립한다.
		
		// 5. 재고의 갯수를 1 줄인다.
		
		// 6. 주문 테이블(배송)에 정보를 추가한다.
		
	}

}