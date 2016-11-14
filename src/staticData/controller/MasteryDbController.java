package staticData.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import staticData.model.ChampDbService;
import staticData.model.MasteryDbService;

@Controller
@RequestMapping("/staticData")
public class MasteryDbController {
	
	@Autowired
	MasteryDbService service;
	
	@RequestMapping("/putMasteryDB")
	public String putMasteryDB() {
		service.putMasteryDB();
		
		return "aaa";
	}
	
	@RequestMapping("/showMasteryDB")
	public ModelAndView showMasteryDB() {
		ModelAndView mav = new ModelAndView("/staticData/masteryList");
		List list = service.showAll();
		mav.addObject("list", list);
		
		return mav;
	}
}
