package ChampInfo.controller;

import java.util.ArrayList;
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
		ModelAndView mav = new ModelAndView("cm:champInfo/list");
		List list = cs.championList();
		mav.addObject("champList", list);
		return mav;
	}
	
	@RequestMapping("champInfo/info/{id}")
	public ModelAndView info2(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("cm:champInfo/info");
		HashMap map = cisvc.getChampInfo(id);
		mav.addObject("info", map);
		String video = cs.getVideo(id);
		
		if(video != null)
			mav.addObject("video", video);
		
		return mav;
	}
	
	@RequestMapping("/champInfo/skin/{name}/{id}")
	public ModelAndView skin(@PathVariable String name, @PathVariable int id) {
		ModelAndView mav = new ModelAndView("cm:champInfo/skin");
		ArrayList list = cisvc.getChampSkin(id);
		mav.addObject("name", name);
		mav.addObject("skins", list);
		
		return mav;
	}
}
