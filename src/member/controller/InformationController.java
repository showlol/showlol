package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.InformationService;
import member.model.pojo.MemberData;

@Controller
public class InformationController {
	@Autowired
	InformationService is;
	
	@RequestMapping("/information")
	@ResponseBody
	public ModelAndView information(HttpSession session, String nick) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cm:member/information");
		
		MemberData data = is.informationsv(nick);
		mav.addObject("data", data);
		return mav;
	}
	@RequestMapping("/delMem/del")
	@ResponseBody
	public boolean delMem(String email, String nick, HttpSession session) {
		boolean dm = is.delMem(email)==true? true : false;
		session.removeAttribute("nick");
		boolean dc = is.delMemCon(nick)==true? true : false;
		boolean dr1 = is.delMemRe1(nick)==true? true : false;
		boolean dr2 = is.delMemRe2(nick)==true? true : false;
		boolean dcm = is.delComu(nick)==true? true : false;
		boolean cr1 = is.delComuRe1(nick)==true? true : false;
		boolean cr2 = is.delComuRe2(nick)==true? true : false;
		if(dm==true && dc==true && dr1==true && dr2==true && dcm==true && cr1==true && cr2==true) {
			return true;
		}
		return false;
	}
}
