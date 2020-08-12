package test.main4;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MainClass01 {
	public static void main(String[] args) {
		
		//비밀번호라고 가정
		String pwd = "abcd1234";
		CharSequence pwd2 = "abcd1234"; // (==String)
		
		//비밀번호를 인코딩할 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		for(int i=0; i<10; i++) {
			//비밀번호를 암호화한 문자열 얻어내기
			String result = encoder.encode(pwd);
			
			//결과 출력하기
			System.out.println(result);
		}
		
		/*
		 * 같은 문자열이지만 수행할 때마다 다른 문자열이 나타난다.
		 * —> 원본을 추론할 수 없다.
		 * */
	}
}
