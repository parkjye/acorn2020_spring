package com.gura.spring05.file.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.file.service.FileService;

@Controller
public class FileController {
	
	/*
	 * 하나의 Controller가 여러개의 service에 의존하기 때문에
	 * service명을 정확히 명시하는 것이 좋다. 
	 * */
	@Autowired
	private FileService fileService;
	
	
	//파일 목록 보기 요청 처리
	@RequestMapping("/file/list")
	public ModelAndView list(HttpServletRequest request, ModelAndView mView) {
		
		//fileService 를 이용해서 비즈니스 로직을 처리한다.
		fileService.getList(request);
		
		mView.setViewName("file/list");
		return mView;
	}
	
	
}//FileController
