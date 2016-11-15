package login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import login.model.LoginService;
import member.model.pojo.MemberData;

@Controller
public class LoginController {
	@Autowired
	LoginService ls;
	
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	@RequestMapping("/login/loginData")
	@ResponseBody
	public MemberData logindata(MemberData data) {
		return ls.loginservice(data);
	}
}
