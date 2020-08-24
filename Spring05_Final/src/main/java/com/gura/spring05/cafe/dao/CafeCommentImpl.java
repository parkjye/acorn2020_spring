package com.gura.spring05.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.cafe.dto.CafeCommentDto;

@Repository
public class CafeCommentImpl implements CafeCommentDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<CafeCommentDto> getList(int ref_group) {

		return session.selectList("cafeComment.getList", ref_group);
	}

	@Override
	public void delete(int num) {
		//삭제할 때 댓글 내용만 삭제하고 row는 남겨둬야 한다.
		session.update("cafeComment.delete", num);

	}

	@Override
	public void insert(CafeCommentDto dto) {
		session.insert("cafeComment.insert", dto);

	}

	@Override
	public int getSequence() {
		return session.selectOne("cafeComment.getSequence");

	}

	@Override
	public void update(CafeCommentDto dto) {
		session.update("cafeComment.update", dto);

	}

}