package summoner.controller;

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
		List list = lsvc.getLeague((int)bsvc.sinfo.get("id"));
		mav.addObject("list", list);
		
		return mav;
	}
}
