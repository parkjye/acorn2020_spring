package test.util;

import org.springframework.stereotype.Component;

//Component scan을 했을 때, bean이 될 수 있도록 어노테이션을 붙힌다.
@Component
public class WritingUtil {
	public void write1() {
		
		System.out.println("편지를 써요");
		
	}
	
	public void write2() {
		
		System.out.println("보고서를 써요");
		
	}
	
	public void write3() {
		
		System.out.println("일기를 써요");
		
	}
	
}//WritingUtil
