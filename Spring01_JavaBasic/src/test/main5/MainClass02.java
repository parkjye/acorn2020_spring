package test.main5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import test.util.Messenger;

public class MainClass02 {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("test/main5/init.xml");
		
		//Messenger가 bean이 됐기 때문에
		//spring container로부터 Messenger type의 참조값 얻어오기
		Messenger m = context.getBean(Messenger.class);
		
		//bean의 메소드 사용하기
		m.sendGreeting("Good afternoon!");
		m.sendGreeting("좋은 아침!");
		m.sendGreeting("바보야 안녕");
		String msg = m.getMessage();
		
		//bean이 리턴한 데이터 확인하기
		System.out.println("Messenger 객체가 리턴한 msg: "+msg);
	}	
}
