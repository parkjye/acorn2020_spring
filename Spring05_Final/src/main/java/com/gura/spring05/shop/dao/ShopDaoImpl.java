package com.gura.spring05.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.shop.dto.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao{
	@Autowired SqlSession session;
	
	//(@Autowired) setter 메소드를 통해서 주입된다.
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ShopDto> getList() {
		
		return session.selectList("shop.getList");
	}

	@Override
	public void minusCount(int num) {
		session.update("shop.minusCount", num);
		
	}

	@Override
	public void minusMoney(ShopDto dto) {
		session.update("shop.minusMoney", dto);
		
	}

	//상품 구입 가격의 10%를 적립
	@Override
	public void plusPoint(ShopDto dto) {
		session.update("shop.plusPoint", dto);
		
	}

	@Override
	public int getPrice(int num) {
		
		return session.selectOne("shop.getPrice", num);
	}

}
