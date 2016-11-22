package summoner.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.BasicService;

@Controller
public class BasicController {
	
	@Autowired
	BasicService bsvc;
	
	@RequestMapping("/summoner/index")
	public ModelAndView index(String userName) {
		ModelAndView mav = new ModelAndView("sIndex");
		//mav.addObject("userName", userName);
		HashMap map = bsvc.getSummonerInfo(userName);
		mav.addObject("userInfo", map);
		return mav;
	}
}
