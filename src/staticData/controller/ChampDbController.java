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

@Controller
@RequestMapping("/staticData")
public class ChampDbController {
	
	@Autowired
	ChampDbService service;
	
	@RequestMapping("/putChampDB")
	public String putChampDB() {
		service.putChampDB();
		
		return "aaa";
	}
	
	@RequestMapping("/showChampDB")
	public ModelAndView showChampDB() {
		ModelAndView mav = new ModelAndView("staticData/champList");
		List list = service.showAll();
		mav.addObject("list", list);
		
		return mav;
	}
}
