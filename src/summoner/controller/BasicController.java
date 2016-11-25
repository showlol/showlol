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
	public ModelAndView index(String userName, HttpServletResponse resp, @CookieValue(required=false) String hist) {
		ModelAndView mav = new ModelAndView("sIndex");
		//mav.addObject("userName", userName);
		HashMap map = bsvc.getSummonerInfo(userName);
		mav.addObject("userInfo", map);
		HashMap map2 = lsvc.getUserLeagueInfo((int)bsvc.sinfo.get("id"));
		mav.addObject("tierInfo", map2);
		
		Cookie c = null;
		boolean flag;
		if(hist != null) {
			flag = bsvc.isCookie(hist, userName);
			if(!flag) {
				try {
					c = new Cookie("hist", URLEncoder.encode(hist + "," + userName,"utf-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				c.setPath("/");
				c.setMaxAge(60*60);
				resp.addCookie(c);
			}
		} else {
			try {
				c = new Cookie("hist", URLEncoder.encode(userName,"utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			c.setPath("/");
			c.setMaxAge(60*60);
			resp.addCookie(c);
		}
		
		return mav;
	}
}
