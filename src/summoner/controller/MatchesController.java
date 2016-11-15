package summoner.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.MatchesService;
import summoner.model.RecentGamesDto;

@Controller
@RequestMapping("/summoner")
public class MatchesController {
	
	@Autowired
	MatchesService msvc;
	
	@RequestMapping(value="/matches", method=RequestMethod.GET)
	public String matches() {
		return "summoner/matches";
	}
	
	@RequestMapping(value="/matches", method=RequestMethod.POST)
	public ModelAndView matches(String type, String sname) {
		ModelAndView mav = new ModelAndView("summoner/matches");
		List<RecentGamesDto> list = msvc.getGameInfo(type, sname);
		mav.addObject("list", list);
		
		return mav;
	}
}
