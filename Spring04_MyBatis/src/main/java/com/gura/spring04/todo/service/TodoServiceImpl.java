package com.gura.spring04.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.todo.dao.TodoDao;
import com.gura.spring04.todo.dto.TodoDto;

@Service
public class TodoServiceImpl implements TodoService{
	
	@Autowired
	private TodoDao dao;

	@Override
	public void addList(TodoDto dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public void updateList(TodoDto dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void deleteList(int num) {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	// todolist 1개 (수정)
	@Override
	public void getList(int num, ModelAndView mView) {
		// TODO Auto-generated method stub
		TodoDto dto = dao.getData(num);
		mView.addObject("dto", dto);
	}

	@Override
	public void getTodolist(ModelAndView mView) {
		// TODO Auto-generated method stub
		List<TodoDto> list = dao.getList();
		mView.addObject("list", list);
	}
	
}
