package summoner.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summoner.model.ChampService;

@Controller
public class ChampController {
	
	@Autowired
	ChampService csvc;
	
	@RequestMapping("/summoner/champion")
	public ModelAndView champion(String userName) {
		ModelAndView mav = new ModelAndView("/summoner/champion");
		ArrayList list = csvc.getChampData(0);
		if(list != null)
			mav.addObject("list", list);
		
		return mav;
	}
}
