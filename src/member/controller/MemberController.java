package member.controller;

import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberService;
import member.model.pojo.MemberData;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;
	@Autowired
	JavaMailSender sender;
	
	@RequestMapping("/join")
	public String join() {
		return "cm:member/join";
	}
	@RequestMapping("/member/regist")
	@ResponseBody
	public String regist(MemberData data) {
		System.out.println(data);
		String str = ms.register(data)+"";
		return str;
	}
	@RequestMapping("/member/auth")
	public String sendEmail(String email, MemberData data){
		ms.register(data);
		try {
			MimeMessage message = sender.createMimeMessage();
			message.setRecipients(RecipientType.TO, email);
			message.setFrom(new InternetAddress("ss"));
			message.setSubject("요청하신 인증키입니다.");
			String text = "";
			text += "인증키를 복사해 입력해주세요.";
			text += "";
			message.setText(text, "utf-8", "html");
			
			sender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
