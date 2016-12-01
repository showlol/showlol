package ChampInfo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ChampInfo.model.ChampInfoService;
import tactics.model.ChampionService;

@Controller
public class ChampInfoController {
	
	@Autowired
	ChampInfoService cisvc;
	
	@Autowired
	ChampionService cs;
	
	@RequestMapping("/champInfo/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("champInfo/list");
		List list = cs.championList();
		mav.addObject("champList", list);
		return mav;
	}
	
	@RequestMapping("champInfo/info/{id}")
	public ModelAndView info(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("champInfo/info");
		HashMap map = cisvc.getChampInfo(id);
		mav.addObject("info", map);
		
		return mav;
	}
}
