package summoner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.MasteryService;

@Controller
public class MasteryController {

	@Autowired
	MasteryService service;
	
	@RequestMapping(value="/summoner/mastery", method=RequestMethod.GET)
	public String mastery(String id) {
		return "summoner/mastery";
	}
	
	@RequestMapping(value="/summoner/mastery", method=RequestMethod.POST)
	public ModelAndView mastery2(String name) {
		ModelAndView mav = new ModelAndView("summoner/mastery");
		int sid = service.getSummonerId(name);
		List list = service.getSummonerMastery(sid+"");
		mav.addObject("list", list);
		
		return mav;
	}
}
