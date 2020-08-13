package com.gura.spring05.file.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.file.dto.FileDto;
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
		
		//fileService를 이용해서 비즈니스 로직을 처리한다.
		fileService.getList(request);
		
		mView.setViewName("file/list");
		return mView;
	}
	
	@RequestMapping("/file/private/upload_form")
	public ModelAndView uploadForm(ModelAndView mView) {
		
		mView.setViewName("file/private/upload_form");
		return mView;
	}
	
	//파일 업로드 요청처리
	@RequestMapping(value = "/file/private/upload", method=RequestMethod.POST)
	public ModelAndView upload(FileDto dto, ModelAndView mView, HttpServletRequest request) {
		
		fileService.saveFile(dto, mView, request);
		mView.setViewName("file/private/upload");
		return mView;
	}
	
	//파일 다운로드 요청처리
	@RequestMapping("/file/download")
	public ModelAndView download(@RequestParam int num, ModelAndView mView) {
		
		//mView에 다운로드할 파일의 정보를 담는다.
		fileService.getFileDate(num, mView);
		
		/*
		 * [ view페이지로 이동해서 다운로드 시켜준다. ]
		 * 
		 * 	view container에서 이름(fileDownView)에 해당하는 view를 찾는다. (0순위)
		 * 	없으면, view폴더에 있는 .jsp페이지를 찾고 (1순위)
		 * 	해당 폴더에도 없으면 404 error.
		 *  
		 *  @Component("fileDownView")가 붙어있는 AbstractView 객체를 찾아간다. 
		 * */
		mView.setViewName("fileDownView");
		return mView;
	}
	
	//파일 삭제 요청 처리
	@RequestMapping("/file/private/delete")
	public ModelAndView delete(@RequestParam int num, ModelAndView mView, HttpServletRequest request) {
		
		fileService.deleteFile(num, request);
		mView.setViewName("redirect:/file/list.do");
		
		return mView;
	}
	
	
	
}//FileController
