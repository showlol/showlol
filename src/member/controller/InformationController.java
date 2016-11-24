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
	public boolean delMem(String email) {
		boolean dm = is.delMem(email)==true? true : false;
		return dm;
	}
}
