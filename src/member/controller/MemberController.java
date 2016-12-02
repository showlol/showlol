package member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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
	@ResponseBody
	public String sendEmail(String email){
		String uuid = ms.sendEmail(email);
		if(uuid==null) {
			return "N";
		}
		try {
			
			MimeMessage message = sender.createMimeMessage();
			message.setRecipients(RecipientType.TO, email);
			message.setFrom(new InternetAddress("ss"));
			message.setSubject("��û�Ͻ� ����Ű�Դϴ�.");
			String text = "";
			text += "����Ű�� ������ �Է����ּ���.<br/>";
			text += "["+uuid+"]";
			message.setText(text, "utf-8", "html");
			
			sender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
			return "N";
		}
		return "Y";
	}
	@RequestMapping("/member/complete")
	@ResponseBody
	public boolean authMail(String email, String uuid) {
		boolean r =  ms.authMail(email, uuid);		
		return r;
	}
}
