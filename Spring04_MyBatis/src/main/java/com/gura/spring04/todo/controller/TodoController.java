package com.gura.spring04.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gura.spring04.todo.service.TodoService;

@Controller
public class TodoController {
	@Autowired
	private TodoService service;
	
}
