package test.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/*
 * 	[ Aspect: 공통 관심사(횡단 관심사) ]
 * 		- AOP 특징 중 하나 (=AOP(Aspect Oriented Programming) 관점 지향 프로그래밍)
 * 		- 핵심 비즈니스 로직과 상관없는 공통관심사를 따로 작성한다.
 * 
 *  	- @Component 어노테이션을 붙혀서 빈으로 만든다. (Bean이 되면 Spring이 관리하는 거니까)
 *  	- @Aspect(공통관심사)를 붙혀서 역할을 할 수 있도록 한다.
 * */
@Aspect
@Component
public class WritingAspect {
	
	/*
	 *  [ 
	 *  	@Before :: 메소드가 실행되기 '바로 직전'에 적용될 수 있도록 설정하는 어노테이션
	 *  	@After :: 메소드 '실행 직후'에 적용
	 *  
	 *  		특징1. 단독 작업만 가능하다.
	 *  		특징2. 활용도가 낮다.
	 *  			이유1. @Before의 경우 메소드가 호출되기 전에 적용되서, 전달된 인자를 활용한 작업이 불가능하다.
	 *  			이유2. @After의 경우 메소드 호출 후 리턴된 값을 활용해서 조작, 조사가 불가능하다.
	 *  	]
	 * 	
	 * 		- @Before("execution(void write1())")
	 * 			return Type이 void인 writer1() 수행 바로 직전에 적용.
	 * 
	 * 		- write*() 
	 * 			write로 시작되는 모든 메소드를 뜻한다.
	 * */
	@Before("execution(void write*())") //AspectJ Expression
	public void prepare() {
		System.out.println("pen을 준비해요.");
	}
	
	@After("execution(void write*())")
	public void end() {
		System.out.println("다 사용한 pen을 마무리해요.");
	}
	
/*
 * 	[ AspectJ Expression ]
 * 
 * 		** point cut: AOP가 적용되는 위치
 * 		** execution(리턴타입 패키지명.클래스명.메소드명(전달 인자))
 * 		** 애스터리스크 * 는 와일드 카드로 사용
 * 
 * 		() 전달 인자가 반드시 없어야한다.
 *  	(..) 있어도 되고 없어도 된다.
 *  	(*) 반드시 인자 1개
 *  	(*,*) 반드시 2개
 *  	(*,*,*) 반드시 3개 ... . 
 * 
 * 
 * 	1. execution(* *(..))
 * 		- point cut: 접근 가능한 모든 메소드
 * 
 * 	2. execution(* test.service.*.*(..))
 * 		- return type: 모든 type (상관없음) 
 * 		- point cut: test.service 패키지의. 모든 객체의. 모든 메소드
 * 
 * 	3. execution(void insert*(..))
 * 		- point cut: 리턴 type은 void이고 메소드명이 insert로 시작하는 모든 메소드
 * 
 * 	4. execution(* delete*(*))
 * 		- point cut: 메소드명이 delete로 시작하고, 1개의 인자를 전달받는 메소드
 *      
 * 	5. execution(* delete*(*,*))
 * 		- point cut: 메소드명이 delete로 시작하고, 2개의 인자를 전달받는 메소드
 * 
 *  6. execution(String update*(Integer,*))
 *  	- return type: String
 *  	- point cut: 메소드명이 update로 시작하고, 전달 인자의 첫번째는 Integer, 두번째는 모든type.
 *      
 *  7. excution(* *(java.lang.String,*))
 *  	- point cut: 첫번째 인자는 String, 두번째 인자는 모든 type을 전달받는 모든 메소드
 *  
 *  8. execution(test.member.MemberDto *(..))
 *  	- point cut: 리턴 타입이 반드시 MemberDto이고, 접근 가능한 모든 메소드
 *  
 */
	
}//WritingAspect
