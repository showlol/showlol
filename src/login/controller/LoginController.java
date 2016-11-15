package login.controller;

import javax.servlet.http.HttpSession;

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
	public String logindata(HttpSession session, MemberData data) {
		MemberData md = ls.loginservice(data);
		if(md==null) {
			return "false";
		} else {
			session.setAttribute("nick", md.getNick());
			return "true";
		}
	}
}
