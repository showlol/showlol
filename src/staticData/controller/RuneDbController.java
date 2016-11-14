package staticData.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import staticData.model.RuneDbService;

@Controller
@RequestMapping("/staticData")
public class RuneDbController {
	
	@Autowired
	RuneDbService service;
	
	@RequestMapping("/putRuneDB")
	public String putRuneDB() {
		service.putRuneDB();
		
		return "aaa";
	}
	
	@RequestMapping("/showRuneDB")
	public ModelAndView showRuneDB() {
		ModelAndView mav = new ModelAndView("/staticData/runeList");
		List list = service.showAll();
		mav.addObject("list", list);
		
		return mav;
	}
}
