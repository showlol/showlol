package community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.model.SearchSevice;

@Controller
public class SearchController {
	
	@Autowired
	SearchSevice ss;
	/*
	
	@RequestMapping("/community/search")
	@ResponseBody
	public List searchResolve(String title) {
		List li = ss.findStartWith(title);
		return li;
	}
	*/
	
	
	@RequestMapping("/community/search")
	public ModelAndView searchResolveType2(String title) {
		List li = ss.findStartWith(title);
		ModelAndView mav = new ModelAndView();
			mav.addObject("li", li);
			mav.setViewName("community/searchResult");
		return mav;
	}
	
	
	
	/*
	@RequestMapping("/community/search")
	public ModelAndView searchwriten(String title){
		ModelAndView mav = new ModelAndView();
		List list = ss.findwrite(title); 
		mav.setViewName("community/main");
		mav.addObject("list",list);
		return mav;
	}
	*/
}
