package com.gura.spring05.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class TimeAspect {
	
	@Around("execution(* com.gura.spring05.file.controller.*.*(..))")
	public Object checkTime(ProceedingJoinPoint joinPoint) throws Throwable {
		
		//로그를 출력할 객체의 참조값 얻어오기
		Logger logger = LoggerFactory.getLogger(joinPoint.getClass());
		
		//logger.info("요청처리 시작");
		System.out.println("요청처리 시작");
		long startTime = System.currentTimeMillis();
		
		//AOP가 적용된 메소드 호출하기
		Object obj = joinPoint.proceed();
		
		long endTime = System.currentTimeMillis();
		long term = startTime-endTime;
		System.out.println("요청처리에 소요된 시간: "+term);
		System.out.println("요청처리 끝");
		//logger.info("요청처리 끝");
		return obj;
	}
}
