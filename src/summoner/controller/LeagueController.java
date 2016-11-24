package summoner.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.BasicService;
import summoner.model.LeagueService;

@Controller
public class LeagueController {
	
	@Autowired
	LeagueService lsvc;
	
	@Autowired
	BasicService bsvc;
	
	@RequestMapping("/summoner/league")
	public ModelAndView league(){
		ModelAndView mav = new ModelAndView();
		//String division = lsvc.getUserDivision((int)bsvc.sinfo.get("id"));
		HashMap map2 = lsvc.getUserLeagueInfo((int)bsvc.sinfo.get("id"));
		ArrayList entries = (ArrayList)map2.get("entries");
		LinkedHashMap map3 = (LinkedHashMap)entries.get(0);
		HashMap map = lsvc.getLeague((int)bsvc.sinfo.get("id"), (String)map3.get("division"));
		mav.addObject("map", map);
		mav.addObject("map2", map2);
		
		return mav;
	}
}
