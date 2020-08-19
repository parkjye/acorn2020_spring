package com.gura.spring05.cafe.dao;

import java.util.List;

import com.gura.spring05.cafe.dto.CafeCommentDto;

public interface CafeCommentDao {

	public List<CafeCommentDto> getList(CafeCommentDto dto); //댓글 목록 얻어오기
	public void delete(int num); //삭제
	public void insert(CafeCommentDto dto); //추가
	public int getSequence(); //추가할 댓글의 글번호 리턴
	public void update(CafeCommentDto dto); //수정
	public CafeCommentDto getData(int num); //한 개의 댓글 정보 리턴
	public int getCount(int ref_group); //댓글의 갯수를 리턴

}//CafeCommentDao

