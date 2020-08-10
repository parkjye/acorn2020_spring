package com.gura.spring04.todo.dao;

import java.util.List;

import com.gura.spring04.todo.dto.TodoDto;

public interface TodoDao {
	public void insert(TodoDto dto);
	public void delete(int num);
	public void update(TodoDto dto);
	public TodoDto getData(int num);
	public List<TodoDto> getList();
}
