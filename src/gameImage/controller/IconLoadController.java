package gameImage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gameImage.model.IconLoadService;
import staticData.model.ChampData;

@Controller
public class IconLoadController {
	@Autowired
	IconLoadService ils;
	
	@RequestMapping("/gameIcon")
	public ModelAndView gameIcon(){
		ModelAndView mav = new ModelAndView("iconTable");	
		mav.addObject("champList", ils.champList);
		mav.addObject("runeList", ils.runeList);
		mav.addObject("masteryList", ils.masteryList);
		return mav;
	}
	@RequestMapping("/runeData")
	public ModelAndView runeData(){
		ModelAndView mav = new ModelAndView("/tactics/runeData");	
		mav.addObject("champList", ils.champList);
		mav.addObject("runeList", ils.runeList);
		mav.addObject("masteryList", ils.masteryList);
		return mav;
	}
}
