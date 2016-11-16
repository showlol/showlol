package login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LogoutController {
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(HttpSession session) {
		session.removeAttribute("nick");
		return "success";
	}
}
