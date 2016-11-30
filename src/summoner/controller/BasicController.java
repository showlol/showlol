package summoner.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.BasicService;
import summoner.model.LeagueService;

@Controller
public class BasicController {
	
	@Autowired
	BasicService bsvc;
	
	@Autowired
	LeagueService lsvc;
	
	@RequestMapping("/summoner/index")
	public ModelAndView index(String userName, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		//mav.addObject("userName", userName);
		HashMap map = bsvc.getSummonerInfo(userName);
		if(map != null) {
			mav.setViewName("sIndex");
			mav.addObject("userInfo", map);
			HashMap map2 = lsvc.getUserLeagueInfo((int)bsvc.sinfo.get("id"));
			mav.addObject("tierInfo", map2);
		}else {
			mav.setViewName("summoner/wrongId");
		}
		
		return mav;
	}
}
