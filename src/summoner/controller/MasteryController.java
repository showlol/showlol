package summoner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.BasicService;
import summoner.model.MasteryService;

@Controller
public class MasteryController {

	@Autowired
	BasicService bsvc;
	
	@Autowired
	MasteryService msvc;
	
	@RequestMapping("/summoner/masterys") 
	public ModelAndView masterys(String userName) {
		ModelAndView mav = new ModelAndView("summoner/mastery");
		List list = msvc.getSummonerMastery(bsvc.sinfo.get("id")+"");
		mav.addObject("list", list);
		
		return mav;
	}
}
