package com.gura.spring02;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FriendsController {
	
	@RequestMapping("/friends")
	public String friends(HttpServletRequest request) {
		String[] friends = {"김구라", "해골", "원숭이"};
		request.setAttribute("friends", friends);
		
		return "friends";
	}
}
