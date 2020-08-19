package com.gura.spring05.cafe.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CafeServiceImpl implements CafeService{
	@Autowired
	private SqlSession session;
}
