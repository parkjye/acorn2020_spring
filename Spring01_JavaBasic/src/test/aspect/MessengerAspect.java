package test.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MessengerAspect {
	
	//return type void, send로 시작하는 메소드, 전달인자 유무 상관없음
	@Around("execution(void send*(..))")
	public void checkGreeting(ProceedingJoinPoint joinPoint) throws Throwable{
		/*
		 * @Around안에서 ProceedingJoinPoint를 사용할 수 있다.
		 * */ 
		
		
		//1. aop가 적용된 메소드 수행 전에 해야할 작업
		//메소드에 전달된 인자들 목록을 얻어내기
		/*
		 * Ex.
		 * Ex-1. send(String a){}
		 * Ex-2. send(int a, Session b){}
		 * 
		 * Ex-1.의 경우 반복문이 1번 돌고 부모type(Object)로 받았으니까 for문에서 다시 스트링으로 캐스팅
		 * Ex-2.은 반복문 2번(인자가 2개니까) 각 인자에 맞는 타입으로 캐스팅해야한다.
		 * 
		 * 전달인자가 뭔지 모르니까 instanceof를 사용한다.
		 * 
		 * 	* instanceof는 객체 타입을 확인할 때 사용한다.
		 * 		해당 type으로 형변환이 가능한지 boolean type으로 리턴한다.
		 * 
		 * */
		Object[] args = joinPoint.getArgs();
		for(Object tmp:args) {
			//만일 인자가 String type이면,
			if(tmp instanceof String) {
				//원래 type으로 casting
				String msg = (String)tmp;
				System.out.println("aspect에서 읽어낸 내용: "+msg);
				if(msg.contains("바보")) {
					System.out.println("바보는 금지된 단어 입니다.");
					return; //메소드 끝내기(procedd()가 호출이 안된다)
				}
				
			}
		}
		
		//2. aop가 적용된 메소드 수행
		//proceed();는 exception을 발생시키니까 throws Throwable 처리한다. 
		joinPoint.proceed(); 
		
		
		//3. aop가 적용된 메소드 수행 후에 할 작업
	}
	@Around("execution(String get*())")
	public Object checkReturn(ProceedingJoinPoint joinPoint) throws Throwable {
		
		//aop가 적용된 메소드가 리턴하는 데이터 얻어내기
		Object obj = joinPoint.proceed();
		
		//aop가 적용된 메소드가 리턴하는 데이터
		return obj;
	}
	
}
