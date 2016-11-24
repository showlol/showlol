package summoner.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.BasicService;
import summoner.model.RuneService;

@Controller
public class RuneController {

	@Autowired
	RuneService rs;
	
	@Autowired
	BasicService bsvc;
	
	@RequestMapping("/summoner/rune")
	public ModelAndView rune2(String name) {
		ModelAndView mav = new ModelAndView("summoner/rune");
		int sid = rs.getSummonerId(name);
		List list = rs.getSummonerRune(sid+"");
		List<String> runeList = rs.runeImage(list);
		mav.addObject("list", list);
		mav.addObject("runeImg", runeList);
		return mav;
	}
	@RequestMapping(value="/summoner/rune2")
	public ModelAndView rune3(String img){
		ModelAndView mav = new ModelAndView("summoner/rune");
		String ssid = rs.getRuneImg(img);
		mav.addObject("list",ssid);
		
		return mav;
	}
	@RequestMapping("/summoner/runeInfo")
	public ModelAndView runeInfo(String name){
		ModelAndView mav = new ModelAndView("summoner/rune");
		//int sid = rs.getSummonerId(name);
		List list = rs.getSummonerRune(bsvc.sinfo.get("id")+"");
		List res = rs.getRuneInfo(list);
		mav.addObject("list",res);
		
		return mav;
	}
}
