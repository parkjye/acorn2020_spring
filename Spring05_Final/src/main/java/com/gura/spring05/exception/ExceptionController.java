package com.gura.spring05.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(DoNotDeleteException.class)
	//nde인자에는 new DoNotDeleteException(); 객체의 참조값이 들어온다.
	public ModelAndView notDelete(DoNotDeleteException nde) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("exception", nde);
		mView.setViewName("error/info");
		return mView;
	}
}
