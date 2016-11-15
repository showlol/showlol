package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberService;
import member.model.pojo.MemberData;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;
	
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
}
