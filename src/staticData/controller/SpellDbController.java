package staticData.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import staticData.model.SpellDbService;

@Controller
@RequestMapping("/staticData")
public class SpellDbController {
	
	@Autowired
	SpellDbService service;
	
	@RequestMapping("/dataInfo")
	public String dataInfo() {
		return "staticData/dataInfo";
	}
	@RequestMapping("/putSpellDB")
	public String putSpellDB() {
		service.putSpellDB();
		
		return "aaa";
	}
	
	@RequestMapping("/showSpellDB")
	public ModelAndView showSpellDB() {
		ModelAndView mav = new ModelAndView("/staticData/spellList");
		List list = service.showAll();
		mav.addObject("list", list);
		
		return mav;
	}
}
