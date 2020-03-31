package ssm_shop;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Demo {
	public static void main(String[] args) {
		/*
		 * String time = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		 * String time2 =
		 * LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));
		 * System.out.println(time); System.out.println(time2);
		 * 
		 * String s = ""; String s2 = null; System.out.println(s.equals(s2));
		 */
		
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encode = encoder.encode("admin");
		System.out.println(encode);
		
	}
}
