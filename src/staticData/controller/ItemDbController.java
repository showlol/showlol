package staticData.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import staticData.model.ItemDbService;

@Controller
@RequestMapping("/staticData")
public class ItemDbController {
	
	@Autowired
	ItemDbService service;
	
	@RequestMapping("/putItemDB")
	public String putItemDB() {
		service.putItemDB();
		
		return "aaa";
	}
	
	@RequestMapping("/showItemDB")
	public ModelAndView showItemDB() {
		ModelAndView mav = new ModelAndView("/staticData/itemList");
		List list = service.showAll();
		mav.addObject("list", list);
		
		return mav;
	}
}
