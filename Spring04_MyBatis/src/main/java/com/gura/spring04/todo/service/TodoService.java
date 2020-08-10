package com.gura.spring04.todo.service;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.todo.dto.TodoDto;

public interface TodoService {
	public void addList(TodoDto dto);
	public void updateList(TodoDto dto);
	public void deleteList(int num);
	public void getList(int num, ModelAndView mView);
	public void getTodolist(ModelAndView mView);
}
