package summoner.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.BasicService;
import summoner.model.MatchesService;
import summoner.model.RecentGamesDto;

@Controller
@RequestMapping("/summoner")
public class MatchesController {
	
	@Autowired
	MatchesService msvc;
	
	@Autowired
	BasicService bsvc;
	
	@RequestMapping("/index")
	public ModelAndView index(String userName) {
		ModelAndView mav = new ModelAndView("summoner/index");
		//mav.addObject("userName", userName);
		HashMap map = bsvc.getSummonerInfo(userName);
		mav.addObject("userInfo", map);
		
		return mav;
	}
	@RequestMapping("/matches")
	public ModelAndView matches(String userName) {
		ModelAndView mav = new ModelAndView("summoner/matches");		
		if(userName != null) {
			List<RecentGamesDto> list = msvc.getGameInfo(userName);
			mav.addObject("list", list);
			mav.addObject("sname", userName);
		}
		
		return mav;
	}
	
	@RequestMapping("/matchDetail")
	public ModelAndView matchDetail(long gid, int tid) {
		ModelAndView mav = new ModelAndView("summoner/matchDetail");
		HashMap map = msvc.getGameDetailInfo(gid);
		//LinkedHashMap list = msvc.getGameDetailInfo2(gid);
		mav.addObject("map", map);
		mav.addObject("tid", tid);
		
		return mav;
	}
}
