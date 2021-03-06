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
		Logger logger = LoggerFactory.getLogger(joinPoint.getTarget().getClass());
		logger.info("요청 처리 시작!");
		
		//시작시간(ms)
		long startTime = System.currentTimeMillis();
		
		//AOP가 적용된 메소드 호출하기
		Object obj = joinPoint.proceed();
		
		//끝시간(ms)
		long endTime = System.currentTimeMillis();
		
		//시작과 끝의 차이를 얻어낸다.
		long term = startTime-endTime;
		System.out.println("요청처리에 소요된 시간: "+term);
		logger.info("요청 처리 끝!");

		return obj;
	}
}
