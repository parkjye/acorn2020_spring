package com.gura.spring05.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gura.spring05.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;

}
