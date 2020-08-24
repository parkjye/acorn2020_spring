package com.gura.spring05.cafe.dao;

import java.util.List;

import com.gura.spring05.cafe.dto.CafeCommentDto;

public interface CafeCommentDao {
	public List<CafeCommentDto> getList(int ref_group); //댓글 목록 얻어오기
	public void delete(int num); //삭제
	public void insert(CafeCommentDto dto); //추가
	public int getSequence(); //추가할 댓글의 글번호 리턴
	public void update(CafeCommentDto dto); //수정
}