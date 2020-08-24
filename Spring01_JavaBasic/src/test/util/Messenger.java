package test.util;

import org.springframework.stereotype.Component;

/*
 * bean이 된다 = spring이 관리(관리 객체가 됨)
 * 
 * 	[ Inversion of Control (IOC, 제어의 역전) ] 
 * 객체의 생성과 관리를 spring framwork에 맡긴다.
 * */
@Component
public class Messenger {
	public void sendGreeting(String msg) {
		System.out.println("전달된 오늘의 인사: "+msg);
	}
	
	public String getMessage() {
		System.out.println("getMessage()메소드가 수행 됩니다");
		return "공부하자";
	}
	
}
