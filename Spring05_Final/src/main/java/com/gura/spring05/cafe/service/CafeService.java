package com.gura.spring05.cafe.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring05.cafe.dto.CafeCommentDto;
import com.gura.spring05.cafe.dto.CafeDto;

public interface CafeService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(CafeDto dto);
	public void updateContent(CafeDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	
	//댓글 관련 기능
	public void saveComment(HttpServletRequest request); //저장
	public void deleteComment(HttpServletRequest request); //삭제
	public void updateComment(CafeCommentDto dto); //수정
	public void moreCommentList(HttpServletRequest request);//댓글 추가 응답
	
	//ajax
	public List<CafeDto> getList2(HttpServletRequest request);
}
