package com.gura.spring04;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileTestController {
	
	// <input type="file" name="myFile" /> 하나만 전송되는 경우
	@RequestMapping("/upload")
	public String upload(@RequestParam MultipartFile myFile, HttpServletRequest request) {
		/*
		 * < 파일 업로드 동작 >
		 * 
		 * 1. temp(임시)폴더에 저장해둔다.
		 * 2. 업로드 된 파일정보가 MultipartFile myFile객체에 들어간다.
		 * 
		 * 	옮길 대상이 되는 파일 객체를 넣으면, 옮겨준다.
		 *	업로드 폴더의 리얼패스를 읽어서 파일명이 겹치지 않도록 생성해서 준다.
		 * 
		 * action)
		 * 원본 파일명과 저장된 파일명을 각각 얻어낸다.
		 * temp에 있는 파일을 복사해서 webContent에 업로드(붙혀넣기)한다.
		 * 		
		 * */
		
		//원본 파일명
		String orgFileName = myFile.getOriginalFilename();
		
		//파일의 크기
		long fileSize = myFile.getSize();
		
		// webapp/upload 폴더까지 실제 경로
		String realPath = request.getServletContext().getRealPath("/upload");
		
		//저장할 파일의 상세 경로
		String filePath = realPath+File.separator;
		
		/*
		 * [ 디렉토리를 만들 파일 객체 생성 }
		 * 만약 디렉토리가 존재하지 않으면 만들어준다.
		 * */
		File upload = new File(filePath);
		if(!upload.exists()) {
			upload.mkdir();
		}
		
		//저장할 파일명을 구성한다.
		String saveFileName = System.currentTimeMillis()+orgFileName;
		try {
			//upload 폴더에 파일을 저장한다.
			myFile.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("orgFileName", orgFileName);
		request.setAttribute("saveFileName", saveFileName);
		request.setAttribute("fileSize", fileSize);
		
		return "upload";
	}
}
