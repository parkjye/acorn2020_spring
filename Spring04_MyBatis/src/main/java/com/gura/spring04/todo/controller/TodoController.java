package com.gura.spring04.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.todo.dto.TodoDto;
import com.gura.spring04.todo.service.TodoService;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService service;
	
	//전체 목록
	@RequestMapping("/todo/list")
	public ModelAndView list(ModelAndView mView) {
		service.getTodolist(mView);
		mView.setViewName("todo/list");
		
		return mView;
	}
	
	//추가
	@RequestMapping("/todo/insert")
	public String insert(@ModelAttribute TodoDto dto) {
		service.addList(dto);
		
		return "todo/insert";
	}
	
	//삭제
	@RequestMapping("/todo/delete")
	public String delete(@RequestParam int num) {
		service.deleteList(num);
		
		return "redirec:/todo/list.do";
	}
	
	//수정-폼
	@RequestMapping(value="/todo/updateform", method=RequestMethod.GET)
	public ModelAndView updateform(@RequestParam int num, ModelAndView mView) {
		service.getList(num, mView);
		mView.setViewName("todo/updateform");
		
		return mView;
	}
	
	//수정
	@RequestMapping(value="/todo/update", method=RequestMethod.POST)
	public String update(@ModelAttribute TodoDto dto) {
		service.updateList(dto);
		
		return "todo/update";
	}

}
