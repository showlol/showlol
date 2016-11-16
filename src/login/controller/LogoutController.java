package login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		Object ob = session.getAttribute("nick");
		if(ob!=null) {
			session.removeAttribute("nick");
		}
		return "redirect:/";
	}
}
